class WordNet < ApplicationRecord
  establish_connection(Rails.env.to_sym)

  def self.check_tables
    sql="select name from sqlite_master where type='table'"
    res = ActiveRecord::Base.connection.execute(sql)

    tables = []
    res.each { |i| tables << i["name"] }
    tables
  end
end
