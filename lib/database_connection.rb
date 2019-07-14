require 'pg'

class DatabaseConnection
  
  def self.setup(database)
    @connection = PG.connect(dbname: database)
  end

  def self.connection
    @connection
  end

  def self.query(query)
    @connection.exec(query)
  end

end