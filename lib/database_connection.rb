require 'pg'

class DatabaseConnection
  def self.setup(db_connection)
    @connection = PG.connect(db_connection)
  end

  def self.query(query)
    @connection.exec(query)
  end
end
