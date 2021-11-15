require 'pg'

class User

  @@current_user = nil

  attr_reader :id, :username, :email

  def initialize(id, username, email)
    @id = id
    @username = username
    @email = email
  end

  def self.all
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT * FROM users;")
    result.map { |user| User.new(user['id'], user['username'], user['email']) }
  end

  def self.create(username, email)
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    query = "INSERT INTO users (username, email) VALUES ($1, $2);"
    connection.exec_params(query, [username, email])
  end

  # set the current user for the session
  def self.set_user(user)
    User.all.select { |u| @@current_user = u if u.username == user }
  end

  def self.current_user
    !!@@current_user ? @@current_user : User.new('n/a', 'anonymous', 'n/a')
  end

end
