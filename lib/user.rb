require 'pg'

class User
  attr_reader :id, :username, :password

  def initialize(id, username, password)
    @id = id
    @username = username
    @password = password
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['username'], user['password']) }
  end

  def self.create(options)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("INSERT INTO users (username, password) VALUES('#{options[:username]}', '#{options[:password]}') RETURNING id, username, password")
    User.new(result.first['id'], result.first['username'], result.first['password'])
  end

  def self.find(user_id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    return nil unless user_id
    result = connection.exec("SELECT * FROM users WHERE id = #{user_id}")
    User.new(result.first['id'], result.first['username'], result.first['password'])
  end
end
