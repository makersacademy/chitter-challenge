require 'pg'

class DatabaseConnection
  def self.setup(dbname)
    @connection = PG.connect(dbname: "#{dbname}")
  end

  def self.connection
    @connection
  end

  def query(db_query)
    @connection.exec(db_query)
  end
end
