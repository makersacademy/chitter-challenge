require "pg"

class DatabaseConnection
  def self.setup(details)
    @connection = PG.connect(details)
  end

  class << self
    attr_reader :connection
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end
end
