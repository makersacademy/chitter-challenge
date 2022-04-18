require 'pg'

class DatabaseConnection

  attr_reader :connection

  def self.setup(database_name)
    @connection = PG.connect(dbname: database_name)
  end

  def self.query(query, params = [])
    @connection.exec_params(query, params)
  end
end
