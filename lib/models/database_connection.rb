require 'pg'

class DatabaseConnection


  def self.setup
    @connection = PG.connect :dbname => environment
  end

  def self.query(query_string)
    @connection.exec(query_string)
  end

  private

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'chitter_test' : 'chitter'
  end
end