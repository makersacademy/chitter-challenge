require 'database_connection'

class User

  def self.find(username)
    result = DatabaseConnection.query("SELECT id FROM users
                                      WHERE username='#{username}';")
    result.first['id'].to_i
  end

end
