require 'pg'

# Handles persistent connection to database
class DatabaseConnection
  class << self
    attr_reader :connection
  end

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql_string)
    connection.exec(sql_string)
  end
end
