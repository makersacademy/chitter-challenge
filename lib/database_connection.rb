require 'pg'

class DatabaseConnection
  attr_reader :connection

  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  def self.query(string)
    @connection.exec(string)
  end
end
