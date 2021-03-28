require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end 

  def self.connection
    @connection
  end

  def self.query(sql_string)
    @connection.exec(sql_string)
  end 

end
