require 'pg'

class DatabaseConnection

  attr_reader :database

  def self.setup(database_name)
    @database = PG.connect(dbname: "#{database_name}")
  end

  def self.database
    @database
  end

end
