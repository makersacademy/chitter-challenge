require './connect_to_database'

class User
  attr_reader :email, :username, :id

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def self.all
    result = DatabaseConnection.query('select * from users;')
    result.map { |user| User.new(id: user['id'], email: user['email'], name: ['name'], username: user['username']) }
  end

  def self.create(email:, name:, username:, password:)
    result = DatabaseConnection.query("insert into users (email, name, username, password) values ('#{email}', '#{name}', '#{username}', '#{password}') returning id, email, username, name;")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.login(email:, password:)
    result = DatabaseConnection.query("select * from users where email = '#{email}' and password = '#{password}';")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username']) if result.count == 1
  end

  def self.find(user_id:)
    result = DatabaseConnection.query("select * from users where id = #{user_id};")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username']) if result.count == 1
  end
end
