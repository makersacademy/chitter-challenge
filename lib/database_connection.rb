require 'pg'
class DatabaseConnection

  def self.setup(database_name)
    @connection = PG.connect(dbname: database_name)
  end

  def self.connection
    @connection
  end

  def self.query(sql_query)
    @connection.exec(sql_query)
  end

end
