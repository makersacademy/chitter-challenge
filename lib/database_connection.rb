require 'pg'

# We're using a class instance variable to store the connection.
# We can do this because our DatabaseConnection is never going to be instantiated (Singleton object)

class DatabaseConnection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

# our query method only relies on the connection created by set up
# we can remove .connetion method and test
  # def self.connection
  #   @connection
  # end

  def self.query(sql_string, params = [])
    @connection.exec_params(sql_string, params)
  end
end