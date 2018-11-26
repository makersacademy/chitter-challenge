require 'pg'

class DatabaseConnection
  # use of class instance methods to maintain one connection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  class << self
    attr_reader :connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end
