require 'pg'

class DatabaseConnection

  # Takes the database to be connected to as an argument and sets
  # up the connection using PG:
  def self.setup(db_name)
    # If rspec test is running, connect to test database
    # instead of live one:
    db_name += "test" if ENV['RACK_ENV'] = 'test'

    @connection = PG.connect :dbname => db_name
  end

  # Takes an SQL query as an argument and runs it using the
  # connection setup above:
  def self.query(sql)
    @connection.exec(sql)
  end

end
