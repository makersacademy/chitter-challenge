require 'pg'

class DatabaseConnection
  @connnection

  def self.setup(db_name)
    @connection = PG::Connection.open(:dbname => db_name )
  end

  def self.query(query)
    result = @connection.exec(query)
  end
end