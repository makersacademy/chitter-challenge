require 'pg'

class User

  attr_reader :id, :email, :password

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    create_connection_to_database
    result = @connection.exec("SELECT * FROM users ORDER BY id DESC;")
    result.map do |user|
      User.new(user['id'], user['email'])
    end
  end

  def self.create(email, password)
    create_connection_to_database
    result = @connection.exec("INSERT INTO users(email, password) VALUES ('#{ email }', '#{ password }') RETURNING id, email; ")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])

  end

  private

  def self.create_connection_to_database
    ENV['RACK_ENV'] == 'test' ? (db = 'chitter_test') : (db = 'chitter')
    @connection = PG.connect(dbname: db)
  end
end