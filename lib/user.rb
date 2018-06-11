require 'pg'
class User
  attr_reader :id, :username

  def initialize(id, email, password, name, username)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def ==(other)
    @id == other.id
  end

  def self.all
    connection = connect_to_database
    result = connection.exec("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password'], user['name'], user['username']) }
  end

  def self.create(options)
    connection = connect_to_database
    result = connection.exec("INSERT INTO users (email, password, name, username) VALUES
    ('#{options[:email]}', '#{options[:password]}', '#{options[:name]}', '#{options[:username]}')
    RETURNING id, email, password, name, username")
    User.new(result.first['id'], result.first['email'], result.first['password'],
      result.first['name'], result.first['username'])
  end

  def self.search(id)
   return nil unless id
   connection = connect_to_database
   result = connection.exec("SELECT * FROM users WHERE id = '#{id}'")
   User.new(result[0]['id'], result[0]['email'], result[0]['password'],\
   result[0]['name'], result[0]['username'])
 end

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_manager_test')
    else
      PG.connect(dbname: 'chitter_manager')
    end
  end

end
