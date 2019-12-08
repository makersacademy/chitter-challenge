require 'pg'

class User

  def self.all 
    users = DatabaseConnection.connect.exec("SELECT * FROM users")
    users.map { |user| user['name'] }
  end

end