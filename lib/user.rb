class User
  # def initialize(id, username, first_name, last_name, email)
  #   # @id = id
  #   # @username = username
  #   # @first_name = first_name
  #   # @last_name = last_name
  #   # @email = email
  # end

  def self.login(username, password)
    result = DatabaseConnection.query("SELECT username, id FROM users WHERE
      username = '#{username}' AND password = '#{password}'")
    result.any? ? result.first["id"].to_i : 0
  end

  def self.add(username, password, first_name, last_name, email)
    return false if exists?(username, nil, email)
    DatabaseConnection.query("INSERT INTO users (
      username, password, first_name, last_name, email) VALUES ('#{username}',
      '#{password}', '#{first_name}', '#{last_name}', '#{email}');")
    true
  end

  def self.delete(username, password)
    # TODO: delete user and it's peeps if user exist
    if exists?(username, password)
      # Peep.delete_peeps(username)
      DatabaseConnection.query("DELETE FROM users WHERE username = '#{username}'")
    end
  end

  private_class_method

  def self.exists?(username, password = nil, email = nil)
    query = ''
    if (password.nil? && email.nil?) # used to check if username is taken
      query = "SELECT username FROM users WHERE username = '#{username}';"
    elsif password.nil? # used to check if email has an account
      query = "SELECT username FROM users WHERE username = '#{username}' OR email = '#{email}';"
    else # used for deletion
      query = "SELECT username FROM users WHERE username = '#{username}' AND password = '#{password}';"
    end
    DatabaseConnection.query(query).any?
  end
end
