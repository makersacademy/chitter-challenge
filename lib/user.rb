require 'pg'

class User

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map do |user|
      new(user['id'], user['username'], user['email'])
    end
  end

  def self.create(username:, email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING id, username, email, password",
      [username, email, password]
    )
    p "we are in user.rb"
    p result.first
    User.new(
      result.first['email'],
      result.first['username'],
      result.first['id'],
      result.first['password']
    )
  end

  def self.authenticate(email:, password:)
    dbname = 'chitter_chatter'
    dbname << '_test' if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: dbname)

    user_entry = connection.exec_params(
      "SELECT * FROM users WHERE email = $1",
      [email]
    )
    return false unless user_entry.any?
    User.new(
      user_entry.first['email'],
      user_entry.first['username'],
      user_entry.first['id']
    )
  end

  def initialize(email, username, id, password = false )
    @id       = id
    @username = username
    @email    = email
    @password = password
  end

  attr_reader :id, :username, :email

end