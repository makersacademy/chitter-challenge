require 'pg'

class User

  attr_reader :name, :username

  def initialize(name:, username:, email:, password:)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.create(name:, username:, email:, password:)
    inserted_data = database_connection.exec("INSERT INTO \"user\" (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING name, username, email, password").first
    User.new(
      name: inserted_data['name'],
      username: inserted_data['username'],
      email: inserted_data['email'],
      password: inserted_data['password']
    )
  end

  def self.find_by_username(username)
    found_data = database_connection.exec("SELECT * FROM \"user\" WHERE username='#{username}'").first
    User.new(
      name: found_data['name'],
      username: found_data['username'],
      email: found_data['email'],
      password: found_data['password']
    )
  end


end
