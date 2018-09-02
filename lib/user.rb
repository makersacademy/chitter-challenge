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
      User.new(user["id"], user["email"], user["username"], user["name"], user["password"])
    end
  end

  def self.create(details)
    select_database

    result = DatabaseConnection.query(
      "INSERT INTO users (email, password, username, name)
      VALUES ('#{details[:email]}', '#{details[:password]}', '#{details[:username]}', '#{details[:name]}')
      RETURNING id, email, username, password, name;"
    )

    User.new(result[0]["id"], result[0]["email"], result[0]["username"], result[0]["name"], result[0]["password"])
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
