require 'database_connection'
require 'pg'

class User
  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    result = DatabaseConnection.query("INSERT INTO person (email, password)
      VALUES('#{email}', '#{password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM person WHERE id = #{id};")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end
end
