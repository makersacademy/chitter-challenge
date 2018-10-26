require 'pg'

class User

  attr_reader :post_id, :user_id, :time, :content

  def initialize(first_name, last_name, email, username, user_id)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @username = username
    @user_id = user_id
  end

  def self.create(first_name, last_name, email, username)
    conn = db_connect
    res = conn.exec("INSERT INTO users (first_name, last_name, email, username) VALUES ('#{first_name}', '#{last_name}', '#{email}', '#{username}') returning *;")[0]
    User.new(res['first_name'], res['last_name'], res['email'], res['username'], res['user_id'])
  end

  def self.all_users
    conn = db_connect
    res = conn.exec("SELECT * FROM users;")
    res.map { |user| User.new(user['first_name'], user['last_name'], user['email'], user['username'], user['user_id']) }
  end

  def self.find(id)
    conn = db_connect
    res = conn.query("SELECT * FROM users WHERE user_id = '#{id}'")[0]
    User.new(res['first_name'], res['last_name'], res['email'], res['username'], res['user_id'])
  end

  def self.db_connect
    db = ENV['RACK_ENV'] == 'test' ? 'chitter_test' : 'chitter'
    PG.connect(dbname: db)
  end

end
