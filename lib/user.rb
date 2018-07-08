require 'pg'

class User
  attr_reader :id, :username, :name, :email, :password

  def initialize(id, username, name, email, password)
    @id = id
    @username = username
    @name = name
    @email = email
    @password = password
  end

  def self.create(username, name, email, password)
    User.switch_db_if_test_env
    user = @con.exec("INSERT INTO users (username, name, email, password)
                      VALUES ('#{username}', '#{name}', '#{email}', '#{password}')
                      RETURNING id, username, name, email, password;")
    User.new(user.first['id'], user.first['username'], user.first['name'],
             user.first['email'], user.first['password'])
  end

  def self.retrieve(id)
    User.switch_db_if_test_env
    user = @con.exec("SELECT * FROM users WHERE id=#{id};")
    User.new(user.first['id'], user.first['username'], user.first['name'],
             user.first['email'], user.first['password'])
  end

  def self.all
    User.switch_db_if_test_env
    users = @con.exec("SELECT * FROM users")
    users.map { |user| User.new(user['id'], user['username'], user['name'],
                                user['email'], user['password'])}
  end

  def self.switch_db_if_test_env
    ENV['ENVIRONMENT'] == 'test' ? dbname = 'chitter_test' : dbname = 'chitter'
    @con = PG.connect :dbname => "#{dbname}"
  end

  # Compare users by id rather than instance
  def ==(other)
    @id == other.id
  end

end
