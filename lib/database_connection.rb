require 'pg'

class DatabaseConnection

  attr_reader :database

  def self.setup(database_name)
    @database = PG.connect(dbname: "#{database_name}")
  end

  class << self
      attr_reader :database
  end

  def self.query(sql)
    @database.exec(sql)
  end

end
