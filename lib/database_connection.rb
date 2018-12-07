require 'pg'

class DatabaseConnection
  class << self
    attr_reader :connection
  end

  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  def self.query(string)
    @connection.exec(string)
  end
end
