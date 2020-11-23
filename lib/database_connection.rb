require 'pg'

class DatabaseConnection

# We're using a class instance variable to store the connection. We can do this because our DatabaseConnection is never going to be instantiated.
# It's a 'Singleton' object: there's only one DatabaseConnection in the application.

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end

  def self.query(sql)
    @connection.exec(sql)
  end

end
