require 'pg'

class User

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

end