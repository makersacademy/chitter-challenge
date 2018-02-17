require "pg"

# Using a class instance variable for @connection. DatabaseConnection will
# never be instantiated. It's a singleton object and there's only
# DatabaseConnection in the application

class DatabaseConnection

  attr_reader :connection

  def self.setup(database_name)
    @connection = PG.connect(dbname: database_name)
  end

  class << self
      attr_reader :connection
  end

  def self.query(query_string)
    @connection.exec(query_string)
  end

end
