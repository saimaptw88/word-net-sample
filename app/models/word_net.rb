class WordNet < ApplicationRecord
  establish_connection(Rails.env.to_sym)

  def self.check_tables
    sql="select name from sqlite_master where type='table'"
    res = ActiveRecord::Base.connection.execute(sql)

    tables = []
    res.each { |i| tables << i["name"] }
    tables
  end

  def self.synonyms_search(word:)
    synonyms = []
    # wordnet に該当用語がある
    sql = "select wordid from word where lemma='#{word}'"
    res = ActiveRecord::Base.connection.execute(sql)
    res[0].present? ? word_id = res[0]["wordid"] : (return synonyms)

    # 該当用語の word_id から概念を検索
    sql = "select synset from sense where wordid='#{word_id}'"
    res = ActiveRecord::Base.connection.execute(sql)
    res[0].present? ? synsets = res.map { |r| r["synset"] } : (return synonyms)

    # 類義語を word_id を使って検索
    synsets.each do |synset|
      sql = "select wordid from sense where (synset='#{synset}' and wordid!=#{word_id})"
      res = ActiveRecord::Base.connection.execute(sql)
      res[0].present? ? synonym_ids = res.map{ |r| r["wordid"] } : break

      synonym_ids.each do |id|
        sql = "select lemma from word where wordid=#{id}"
        res = ActiveRecord::Base.connection.execute(sql)
        synonyms << res[0]["lemma"]
      end
    end

    synonyms
  end
end
