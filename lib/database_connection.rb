require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(sql_query)
    @connection.exec(sql_query)
  end

end
