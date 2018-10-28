require 'pg'

class User

attr_reader :name, :username, :email, :password

  def initialize(name, username, email, password)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name, username, email, password)
    return nil if duplicate_username?(username)
    database_env
    @@con.exec "INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}');"
      User.new(name, username, email, password)
  end

  def self.find_details(username)
    return nil unless username
    database_env
    rs = @@con.exec("SELECT * FROM users WHERE username = '#{username}';")
      rs.map do |user|
      User.new(user['name'], user['username'], user['email'], user['password'])
     end
  end

  def self.authenticate(username)
    database_env
    rs = @@con.exec("SELECT FROM users WHERE username = '#{username}';")
    return unless rs.any?
      rs.map do |user|
        User.new(user['name'], user['username'], user['email'], user['password'])
      end
  end

  private_class_method

  def self.database_env
    @@con = if ENV['ENVIRONMENT'] = 'test'
              PG.connect :dbname => 'chitter_test'
            else
              PG.connect :dbname => 'chitter_manager'
             end
  end

  def self.duplicate_username?(username)
    database_env
    username = @@con.exec("SELECT * FROM users WHERE username = '#{username}';")
      username.any?
  end

end
