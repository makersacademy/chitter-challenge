require_relative "db_connection"
require 'bcrypt'

class User
  attr_reader :email, :id, :name
  def self.create(name, email, pass)
    # magic encyption
    encrypted_pass = BCrypt::Password.create(pass)

    add_user = DbConnection.query("INSERT INTO users (username, email, pass) VALUES ('#{name}','#{email}', '#{encrypted_pass}');")
  end

  def self.find(email)
    find_user = DbConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    User.new(email: find_user[0]["email"], id: find_user[0]["id"], name: find_user[0]["username"])
  end

  def self.find_by_id(id)
    return nil unless !id.nil?
    find_user = DbConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(email: find_user[0]["email"], id: find_user[0]["id"], name: find_user[0]["username"])
  end

  def initialize(email:, id:, name:)
    # symbols are good for adding columns
    @email = email
    @id = id
    @name = name
  end
end
