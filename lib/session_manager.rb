require_relative 'database_manager'

class SessionManager
  def self.authenticate(email, password, user_class = User)
    user = DatabaseManager.query("SELECT * FROM users WHERE " \
      "email = '#{email}';").first
    return false unless user
    return false unless user['password'] == password
    user_class.create_instance(user)
  end
end
