require_relative 'database_connector'

class DatabaseQueryManager

  def self.all_peeps
    db_query("SELECT *
              FROM peeps
              ORDER BY timestamp DESC;")
  end

  def self.all_users
    db_query("SELECT *
              FROM users;")
  end

  private
  def self.db_query(query)
    DatabaseConnector.db_connection.exec("#{query}")
  end
end