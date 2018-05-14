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

  def self.add_peep(user_id, message)
    db_query("INSERT INTO peeps(user_id, peep, timestamp)
              VALUES ('#{user_id}', '#{message}', LOCALTIMESTAMP(0));")
  end

  private
  def self.db_query(query)
    DatabaseConnector.db_connection.exec("#{query}")
  end
end