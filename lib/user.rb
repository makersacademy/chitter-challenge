require "./lib/database_connection"
require "./lib/select_database"

class User

  attr_reader :id, :email, :username, :name, :password

  def initialize(id, email, username, name, password)
    @id = id
    @email = email
    @username = username
    @name = name
    @password = password 
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")

    result.map do |user|
      id = user["id"]
      email = user["email"]
      username = user["username"]
      name = user["name"]
      password = user["password"]

      User.new(id, email, username, name, password)
    end
  end

  def self.create(details)
    select_database

    email = details[:email]
    username = details[:username]
    name = details[:name]
    password = details[:password]

    result = DatabaseConnection.query(
      "INSERT INTO users (email, password, username, name)
      VALUES ('#{email}', '#{password}', '#{username}', '#{name}')
      RETURNING id, email, username, password, name;"
    )

    id = result[0]["id"]

    User.new(id, email, username, name, password)  
  end

  def self.find(id)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")

    id = result[0]["id"]
    email = result[0]["email"]
    username = result[0]["username"]
    name = result[0]["name"]
    password = result[0]["password"]

    User.new(id, email, username, name, password)
  end

end
