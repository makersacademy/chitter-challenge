class User
  def initialize(id, username, first_name, last_name, email)
    # @id = id
    # @username = username
    # @first_name = first_name
    # @last_name = last_name
    # @email = email
  end

  def self.login(username, password)
    result = DatabaseConnection.query("SELECT username FROM users WHERE
      username = '#{username}' AND password = '#{password}'")
    result.first.nil? ? false : result.first['username']
  end

  def self.add(username, password, first_name, last_name, email)

    return false if exists?(username)
    DatabaseConnection.query("INSERT INTO users (
      username, password, first_name, last_name, email) VALUES ('#{username}',
      '#{password}', '#{first_name}', '#{last_name}', '#{email}');")
    # end
  end

  def self.delete(username, password)
    DatabaseConnection.query("DELETE FROM users WHERE username = '#{username}' and password = '#{password}'")
    # DatabaseConnection.query("DELETE FROM peeps WHERE user_id =#{user_id}")
  end

  private

  def self.exists?(username)
    result = DatabaseConnection.query("SELECT username FROM users WHERE
      username = '#{username}';")
    result.first.nil? ? false : true
  end
end

# def correct_login?
#   user_id = DatabaseConnection.query("SELECT id from users WHERE username = '#{username}'")
#   puts "user id is: #{user_id.first}"
# end
