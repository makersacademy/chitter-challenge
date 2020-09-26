require 'pg'

class DatabaseConnection

  attr_reader :connection

  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  def self.query(query)
    @connection.exec(query)
  end

end
