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

  def self.setup_db
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_app_test')
    else
      PG.connect(dbname: 'chitter_app')
    end
  end

  def self.all
    connection = setup_db

    result = connection.exec("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['username'], user['name'], user['email'], user['password']) }
  end

  def self.create(options)
    connection = setup_db

    result = connection.exec("INSERT INTO users (username, name, email, password) VALUES('#{options[:username]}', '#{options[:name]}', '#{options[:email]}', '#{options[:password]}') RETURNING id, username, name, email, password")
    User.new(result.first['id'], result.first['username'], result.first['name'], result.first['email'], result.first['password'])
  end

  def self.find(user_id)
    connection = setup_db

    return nil unless user_id
    result = connection.exec("SELECT * FROM users WHERE id = #{user_id}")
    User.new(result.first['id'], result.first['username'], result.first['name'], result.first['email'], result.first['password'])
  end
end
