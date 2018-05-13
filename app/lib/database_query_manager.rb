require_relative 'database_connector'

class DatabaseQueryManager

  def self.all
    DatabaseConnector.db_connection.exec("SELECT * FROM peeps ORDER BY timestamp DESC;")
  end
end