require 'bcrypt'
require 'pg'
require 'pry'

class User

  attr_reader :first_name, :last_name, :email, :username, :user_id, :password

  def initialize(first_name, last_name, email, username, user_id, password)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @username = username
    @user_id = user_id
    @password = password
  end

  def self.create(first_name, last_name, email, username, password)
    encrypted_password = BCrypt::Password.create(password)
    conn = db_connect
    res = conn.exec("INSERT INTO users (first_name, last_name, email, username, password) VALUES ('#{first_name}', '#{last_name}', '#{email}', '#{username}', '#{encrypted_password}') returning *;")[0]
    User.new(res['first_name'], res['last_name'], res['email'], res['username'], res['user_id'], res['password'])
  end

  def self.all_users
    conn = db_connect
    res = conn.exec("SELECT * FROM users;")
    res.map { |user| User.new(user['first_name'], user['last_name'], user['email'], user['username'], user['user_id'], user['password']) }
  end

  def self.find(id)
    conn = db_connect
    res = conn.query("SELECT * FROM users WHERE user_id = '#{id}'")[0]
    User.new(res['first_name'], res['last_name'], res['email'], res['username'], res['user_id'], res['password'])
  end

  def self.authenticate(username, password)
    conn  = db_connect
    res = conn.query("SELECT * FROM users WHERE username = '#{username}'")
    return unless res.any?
    return unless BCrypt::Password.new(res[0]['password']) == password
    User.new(res[0]['first_name'], res[0]['last_name'], res[0]['email'], res[0]['username'], res[0]['user_id'], res[0]['password'])
    # needs to check that passed password is correct - compare it to encrypted password from database
    # need to have a guard condition in case usernane is not found
    # need to have a guard condition if password is not correct
  end

  def self.db_connect
    db = ENV['RACK_ENV'] == 'test' ? 'chitter_test' : 'chitter'
    PG.connect(dbname: db)
  end

end
