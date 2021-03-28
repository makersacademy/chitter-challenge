require 'bcrypt'

class User

  def self.new_user(username, password, email)
    encrpyted_pw = BCrypt::Password.create(password)

    new_user = DbConnection.query("INSERT INTO users(username, password, email) 
                                   VALUES ('#{username}', '#{encrpyted_pw}', 
                                   '#{email}') RETURNING user_id, username, email;")
    User.new(user_id: new_user[0]['user_id'], username: new_user[0]['username'], 
             email: new_user[0]['email'])
  end

  def self.find(user_id)
    return nil unless user_id

    found = DbConnection.query("SELECT * FROM users WHERE user_id = '#{user_id}';")
    User.new(user_id: found[0]['user_id'], username: found[0]['username'], email: found[0]['email'])
  end

  def self.sign_in(username:, password:)
    sign_in = DbConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    return unless sign_in.any?
    return unless BCrypt::Password.new(sign_in[0]['password']) == password

    User.new(user_id: sign_in[0]['user_id'], username: sign_in[0]['username'], 
             email: sign_in[0]['email'])
  end

  attr_reader :user_id, :username, :email

  def initialize(user_id:, username:, email:)
    @user_id = user_id
    @username = username
    @email =  email
  end
end
