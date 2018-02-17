require 'pg'

class DatabaseConnection

  def self.connect(db_name)
    @connection = PG.connect dbname: db_name
  end

  def self.query(query)
    @connection.exec query
  end

  def self.connection
    @connection
  end

end
