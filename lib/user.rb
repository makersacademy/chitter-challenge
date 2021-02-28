require 'pg'

class User 

  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def self.create(name:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end 

    result = connection.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email;")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.find(id: nil)
    return nil unless id

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("SELECT id, name, username, email FROM users WHERE id= #{id};")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'])
  end

  def self.authenticate(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end 

    result = connection.exec("SELECT id FROM users WHERE email='#{email}' AND password='#{password}';")
    result[0]['id']
  end
end 
