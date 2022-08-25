require 'pg'

class User

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_chatter_test')
    else
      connection = PG.connect(dbname: 'chitter_chatter')
    end

    result = connection.exec("SELECT * FROM users;")

    result.map do |user|
      new(user['id'], user['username'], user['email'])
    end
  end

  def self.create(username:, email:, password:)
    dbname = 'chitter_chatter'
    dbname << '_test' if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: dbname)

    result = connection.exec_params(
      "INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING id, username, email, password",
      [username, email, password]
    )
    User.new(
      result.first['username'],
      result.first['email'],
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
      user_entry.first['id'],
      user_entry.first['usernamhe'],
      user_entry.first['email'],
    )
  end

  def to_s
    {username: username}
  end

  def initialize(username, email, password, id = false)
    @id       = id
    @username = username
    @email    = email
    @password = password
end

  attr_reader :id, :username, :email

end
