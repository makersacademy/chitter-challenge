require 'pg'

class User

  def self.all
    connection = User.connect
    users = connection.exec("SELECT * FROM users;")
    users.map{ |user| User.new(user['name'], user['email'], user['password'])}
  end

  def self.add_new(name, email, password)
    connection = User.connect
    connection.exec("INSERT INTO users(name, email, password) VALUES('#{name}', '#{email}', '#{password}');")
  end

  def self.find_user(email)
    connection = User.connect
    users = connection.exec("SELECT * FROM users WHERE email = #{'email'};")
    users.map { |user| User.new(user['name'], user['email'], user['password']) }
  end

  attr_reader :name, :email, :password

  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password
  end

  private

  def self.connect
    databasename = ENV['ENV_TEST'] == 'test' ? 'chitter_testing' : 'chitter'
    PG.connect(dbname: databasename)
  end


end
