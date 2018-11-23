class DatabaseConnection
  attr_reader :connection  

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end  

  def self.connection
    @connection
  end  

  def self.query(sql_query)
    connection = DatabaseConnection.setup
    connection.exec(sql_query)
  end

end
