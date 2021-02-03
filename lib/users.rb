class Users
  attr_reader :id, :username, :first_name, :secondname, :email, :password

  def initialize(id:, username:, firstname:, secondname:, email:, password:)
    @id = id
    @username = username
    @firstname = firstname
    @secondname = secondname
    @email = email
    @password = password
  end

  def self.all_members
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map do |user|
      Users.new(id: user['id'],
                username: user['username'],
                firstname: user['firstname'],
                secondname: user['secondname'],
                email: user['email'],
                password: user['password'])
    end
  end

  def self.sign_up(username:, firstname:, secondname:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (username, firstname, secondname, email, password)
                                       VALUES('#{username}', '#{firstname}', '#{secondname}', '#{email}', '#{password}')
                                       RETURNING id, username, firstname, secondname, email, password;")
    Users.new(id: result[0]['id'],
              username: result[0]['username'],
              firstname: result[0]['firstname'],
              secondname: result[0]['secondname'],
              email: result[0]['email'],
              password: result[0]['password'])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}' ")
    return unless result.any?

    Users.new(id: result[0]['id'],
              username: result[0]['username'],
              firstname: result[0]['firstname'],
              secondname: result[0]['secondname'],
              email: result[0]['email'],
              password: result[0]['password'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    Users.new(id: result[0]['id'],
              username: result[0]['username'],
              firstname: result[0]['firstname'],
              secondname: result[0]['secondname'],
              email: result[0]['email'],
              password: result[0]['password'])
  end
end
