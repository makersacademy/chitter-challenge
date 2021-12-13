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
    query = "INSERT INTO users(u_name, username, u_email, u_password) 
    VALUES($1,$2,$3,$4) RETURNING id, u_name, username, u_email, u_password;"
    result = DatabaseConnection.query(query, [name, username, email, password])
  end

  def self.view(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id=$1;", [id])
    User.new(result[0]['id'], result[0]['u_name'], 
    result[0]['username'], result[0]['u_email'], result[0]['u_password'])
  end

  def self.all
    users = DatabaseConnection.query("SELECT * FROM users;")
    users.map do |user| 
      User.new(user['id'], user['u_name'], user['username'], user['u_email'], user['u_password'])
    end
  end

  def self.logged_in?(username, password)
    result = User.all.map { |user| user.username == username && user.password == password }
    result.include?(true)
  end

  def self.current_uid(username)
    User.all.map do |user| 
      if user.username == username
        return user.id
      end
    end
  end
end
