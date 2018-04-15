module Database
  
  def setup_test
    @database = PG.connect :dbname => 'chit_test', :user => 'danielwork'
  end

  def setup_regular
    @database = PG.connect :dbname => 'chitter', :user => 'danielwork'
  end

  def all_chits
    @database.exec "SELECT * FROM posts"
  end

  def all_users
    @database.exec "SELECT * FROM users"
  end

  def add_to_chits(chit)
    @database.exec_params('INSERT INTO posts (content, time) VALUES ($1, $2)', [chit.post, chit.time])
  end

  def add_to_users(user)
    @database.exec_params('INSERT INTO users (email, password) VALUES ($1, $2)', [user.username, user.password])
  end

end

class Chitter

  extend Database

  attr_reader :database

  def self.connect
    ENV['RACK_ENV'] == 'test' ? setup_test : setup_regular
  end

  def self.create_user(user)
    add_to_users(user)
  end

  def self.add(chit)
    add_to_chits(chit)
  end

  def self.show_chits
    all_chits.map { |row | Chit.new(row['content'], row['time'])}.reverse
  end

  def self.show_users
    all_users.map { | row | User.new(row['id'], row['email'], row['password'])}
  end

end

class Chit

  attr_reader :post, :time
  
  def initialize(post, time = Time.now.asctime)
    @post = post
    @time = time
  end

end

class User
  attr_reader :id,  :username, :password

  def initialize(id = nil, username, password)
    @id = id
    @username = username
    @password = password
  end

end

