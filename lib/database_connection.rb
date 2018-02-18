require "pg"

class DatabaseConnection

  # attr_reader :connection

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
