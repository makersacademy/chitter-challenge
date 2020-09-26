require 'pg'

class DatabaseConnection

  attr_reader :connection

  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end

end
