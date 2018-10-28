require 'pg'

class DatabaseConnection
  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  class << self
    attr_reader :connection
  end

  def self.query(sql_string)
    @connection.exec(sql_string)
  end
end
