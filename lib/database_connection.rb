require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  class << self
    attr_reader :connection
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end
end
