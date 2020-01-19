require 'pg'
require_relative 'database_connection_setup'

class DatabaseConnection

  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  def self.connection
    @connection
  end

  def self.query(sql_string)
    @connection.exec(sql_string)
  end


end