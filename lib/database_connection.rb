require 'pg'

class DatabaseConnection

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(query_string)
    @connection.exec(query_string)
  end
end
