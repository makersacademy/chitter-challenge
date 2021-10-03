require 'pg'

class User
  attr_reader :id, :username, :email, :password, :created_at

  def self.create(username:, email:, password:)
    connection = db_connection
    new_user = connection.exec("INSERT INTO users (username, email, password, created_at) 
    VALUES('#{username}', '#{email}', '#{password}', '#{Time.now}') 
    RETURNING id, username, email, password, created_at;")
    User.new(id: new_user[0]['id'], 
      username: new_user[0]['username'], 
      email: new_user[0]['email'], 
      password: new_user[0]['password'], 
      created_at: new_user[0]['created_at'])
  end

  def initialize(id:, username:, email:, password:, created_at:)
    @id = id
    @username = username
    @email = email
    @password = password
    @created_at = created_at
  end
end
