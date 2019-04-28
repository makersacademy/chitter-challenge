require 'pg'
require 'bcrypt'

class User
  def self.create(name:, username:, email:, password:)
    password = BCrypt::Password.create(password)
    columns = "(name, username, email, password)"
    values = "('#{name}','#{username}','#{email}','#{password}')"
    sql = "INSERT INTO users #{columns} VALUES #{values} RETURNING *;"
    result = DatabaseConnection.execute(sql).first

    User.new(
      id: result['id'].to_i,
      name: result['name'],
      username: result['username'],
      email: result['email']
    )
  end

  def self.find(id)
    sql = "SELECT * FROM users WHERE id = #{id};"
    result = DatabaseConnection.execute(sql).first

    User.new(
      id: result['id'].to_i,
      name: result['name'],
      username: result['username'],
      email: result['email']
    )
  end

  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end
end
