require 'bcrypt'
require_relative './db_connection'

class Maker
  attr_reader :id, :name, :username, :email

  def initialize(id, name, username, email)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name, username, email, password)
    encrypted_password = BCrypt::Password.create(password)
    p encrypted_password.length
    DBConnection.connect
    result = DBConnection.run_query("INSERT INTO makers (name, user_name, email, password) VALUES($$#{name}$$, $$#{username}$$, $$#{email}$$, $$#{encrypted_password}$$) RETURNING id, name, user_name, email;")
    DBConnection.disconnect

    Maker.new(result[0]['id'], result[0]['name'], result[0]['user_name'], result[0]['email'])
  end

  def self.find(id)
    DBConnection.connect
    result = DBConnection.run_query("SELECT id, name, user_name, email FROM makers WHERE id=#{id}")
    DBConnection.disconnect

    Maker.new(result[0]['id'], result[0]['name'], result[0]['user_name'], result[0]['email'])
  end
end
