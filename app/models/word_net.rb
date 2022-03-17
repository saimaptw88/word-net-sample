class WordNet < ApplicationRecord
  self.abstract_class = true

  connects_to database: {writing: :word_net, reading: :word_net_replica}
  # SQLでWordNetを操作する
  def search
    # テーブルを確認する
    sql = "SELECT * FROM word_nets"
    ActiveRecord::Base.connection.execute(sql)
    # 所望のテーブルで検索
    # 検索結果を取得する
  end
end
