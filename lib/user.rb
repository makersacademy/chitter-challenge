class User
  def initialize(id, username, first_name, last_name, email)
    # @id = id
    # @username = username
    # @first_name = first_name
    # @last_name = last_name
    # @email = email
  end

  def self.login(username, password)
    DatabaseConnection.connect('chitter') # to be removed later
    result = DatabaseConnection.query("SELECT username FROM users WHERE
      username = '#{username}' AND password = '#{password}'")
    result.first.nil? ? false : result.first['username']
  end

  def self.add(username, password, first_name, last_name, email)
    DatabaseConnection.connect('chitter') # to be removed later
    DatabaseConnection.query("INSERT INTO users (
      username, password, first_name, last_name, email) VALUES ('#{username}',
        '#{password}', '#{first_name}', '#{last_name}', '#{email}');")
  end

  def self.delete(username, password)
    DatabaseConnection.connect('chitter') # to be removed later
    DatabaseConnection.query("DELETE FROM users WHERE username = '#{username}' and password = '#{password}'")
  end
end
