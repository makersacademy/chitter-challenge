require_relative './private.rb'

class Database
  def self.exec(command, dbname = DATABASE )

    dbname = 'chitter_test' if ENV['RACK_ENV'] == 'test'

    connection = PG.connect :dbname => dbname, :user => USERNAME
    connection.exec command
  end
end
