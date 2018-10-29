require "./lib/databaseconnection.rb"
require "bcrypt"

class User

attr_reader :name,:password, :email, :id

  def self.create(name:, password:, email:, receive_email:)
    result = Databaseconnection.execute("select * from chitter_user where name = ('#{name}');")
    return "Name already exists" if result.any?
    encrypted_password = BCrypt::Password.create(password)
    str = "insert into chitter_user (name, email, password, receive_email) values ('#{name}','#{email}','#{encrypted_password}','#{receive_email}') returning user_id,name,email,receive_email"
    result = Databaseconnection.execute(str)
    user = User.new(id: result[0]["user_id"], name: result[0]["name"], email: result[0]["email"], receive_email: result[0]["receive_email"])
  end

  def self.find(users:)
    userlist = users.map {|v| "'#{v}'" }.join(',')
    result = Databaseconnection.execute("select * from chitter_user where name in (#{userlist});")
    return "No user" unless result.any?
    resultarr = Array.new
    result.each { |user|
      resultarr.push(User.new(id: user["user_id"], name: user["name"], email: user["email"], receive_email: user["receive_email"]))
    }
    resultarr
  end

  def self.send_password_email(name:, email:)
    str = "select * from chitter_user where name = '#{name}'"
    result = Databaseconnection.execute(str)
    return "No such user" unless result.any?
    return "Email sent" if result[0]["name"] == name
    false
  end

  def self.login(name:, password:)
    str = "select * from chitter_user where name = '#{name}'"
    result = Databaseconnection.execute(str)
    return "No such user" unless result.any?
    return "Incorrect password" if ((result[0]["name"] == name) && (BCrypt::Password.new(result[0]['password']) != password))
    user = User.new(
      id: result[0]["user_id"],
      name: result[0]["name"],
      email: result[0]["email"],
      receive_email: result[0]["receive_email"]
    )
  end

  def initialize(id:, name:, password: "x", email:, receive_email:)
    @id = id
    @name = name
    @password = password
    @email = email
    @receive_email = receive_email
  end
end
