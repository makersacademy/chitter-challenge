require 'pg'

class DatabaseConnection 
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname) # We're using a class instance variable to store the connection. We can do this because our DatabaseConnection is never going to be instantiated. It's a 'Singleton' object: there's only one DatabaseConnection in the application.
  end

  def self.query(sql, params = []) #set params default to empty array for cases like sql = "SELECT * FROM peeps;" where there aren't params
    @connection.exec_params(sql, params) 
    
  end
end