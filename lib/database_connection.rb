require 'pg'
require_relative '../passwords'

class DatabaseConnection

  def self.setup(database = DatabaseConnection.database)
    @connection = PG.connect :dbname => database, :user => USER
  end

  def self.query(query)
    @connection.exec(query)
  end

  class << self
    attr_reader :connection
  end

  def self.database
    return 'chitter_manager_test' if ENV['RACK_ENV'] == 'test'
    return 'chitter_manager'
  end
end
