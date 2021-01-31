class Users
  attr_reader :id, :username, :first_ame, :secondname, :email

  def initialize(id:, username:, firstname:, secondname:, email:)
    @id = id
    @username = username
    @firstname = firstname
    @secondname = secondname
    @email = email
  end

  def self.all_members
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map do |user|
      Users.new(id: user['id'],
                username: user['username'],
                firstname: user['firstname'],
                secondname: user['secondname'],
                email: user['email'])
    end
  end

  def self.sign_up(username:, firstname:, secondname:, email:)
    result = DatabaseConnection.query("INSERT INTO users (username, firstname, secondname, email)
                                       VALUES('#{username}', '#{firstname}', '#{secondname}', '#{email}')
                                       RETURNING id, username, firstname, secondname, email;")
    Users.new(id: result[0]['id'],
              username: result[0]['username'],
              firstname: result[0]['firstname'],
              secondname: result[0]['secondname'],
              email: result[0]['email'])
  end

  # def self.sign_in(username:)
  #   result = DatabaseConnection.query("SELECT * FROM users
  #                                      WHERE username = '#{username}'")
  #   p result
  #   result.count > 0 ? false : @username = username
  # end 

end
