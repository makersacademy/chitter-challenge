require_relative 'database_connection'

class User

  attr_reader :name, :email, :username, :password

  def initialize(name:, email:, username:, password:)
    @name = name
    @email = email
    @username = username
    @password = password
  end

  def exists?
    users = DatabaseConnection.query("SELECT username, email FROM tblusers")
    users.each do |user|
      if @username == user['username'] || @email == user['email']
        return true
      end
    end
    return false
  end

  def self.create(name:, email:, username:, password:)
    DatabaseConnection.query("INSERT INTO tblusers (username, name, email, password) VALUES('#{username}', '#{name}', '#{email}', '#{password}')")
  end

  def self.sign_in(username:, password:)
    signed_in = false
    users = DatabaseConnection.query("SELECT username, password FROM tblusers")
    users.each do |user|
      if username == user['username'] && password == user['password']
        signed_in = true
      end
    end
    return signed_in
  end

end
