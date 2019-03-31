class User
  attr_reader :id, :fullname, :username

  def initialize(id:, fullname:, username:)
    @id = id
    @fullname = fullname
    @username = username
  end

  def self.create(fullname:, email:, username:, password:)
    result = DatabaseConnection.query("INSERT INTO users (fullname, email, username, password) VALUES('#{fullname}', '#{email}', '#{username}', '#{password}') RETURNING id, fullname, username;")
    User.new(id: result[0]['id'], fullname: result[0]['fullname'], username: result[0]['username'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(id: result[0]['id'], fullname: result[0]['fullname'], username: result[0]['username'])
  end
end
