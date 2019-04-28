require 'pg'

class User
  def self.create(name:, username:, email:, password:)
    columns = "(name, username, email, password)"
    values = "('#{name}','#{username}','#{email}','#{password}')"
    sql_statement = "INSERT INTO users #{columns} VALUES #{values} RETURNING *;"
    result = DatabaseConnection.execute(sql_statement).first

    User.new(
      id: result['id'],
      name: result['name'],
      username: result['username'],
      email: result['email']
    )
  end

  def self.find(id)
    sql_statement = "SELECT * FROM users WHERE id = #{id};"
    result = DatabaseConnection.execute(sql_statement).first

    User.new(
      id: result['id'],
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
