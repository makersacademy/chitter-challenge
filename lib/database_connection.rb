require 'pg'

class DatabaseConnection 
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end 

  def self.connection
    @connection
  end 

  def self.query(query, params = [])
    @connection.exec_params(query, params)
  end
end 