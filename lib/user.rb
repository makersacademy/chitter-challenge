require 'pg'

class User

  attr_reader :user_id, :name, :username, :email, :password

  def initialize(user_id:, name:, username:, email:, password:)
    @user_id = user_id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name:, username:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING user_id, name, username, email, password;")
    User.new(user_id: result[0]['user_id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end
end
