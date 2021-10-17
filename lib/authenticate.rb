require_relative 'database_connection'

def authenticate(username:, password:)
  result = DatabaseConnection.query(
    "SELECT EXISTS (
      SELECT *
      FROM userdb
      WHERE username = $1 AND password = $2
    );", [username, password]
  )
  return result[0]
end
