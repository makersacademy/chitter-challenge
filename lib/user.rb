require './lib/database_connection'

class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name, username, email, password)
    query = "INSERT INTO users(u_name, username, u_email, u_password) VALUES($1,$2,$3,$4) RETURNING id, u_name, username, u_email, u_password;"
    result = DatabaseConnection.query(query, [name, username, email, password])
  end

  def self.view(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id='#{id}';")
    User.new(result[0]['id'], result[0]['u_name'], result[0]['username'], result[0]['u_email'], result[0]['u_password'])
  end
end
