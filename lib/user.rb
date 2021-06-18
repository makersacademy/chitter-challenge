require './lib/database_connection.rb'

class User
  attr_reader :first_name, :id

  def initialize(first_name, id)
    @first_name = first_name
    @id = id
  end

  def self.create(first_name, email, password)
    result = DatabaseConnection.query("INSERT INTO users (first_name, email, password) VALUES ('#{first_name}', '#{email}', '#{password}') RETURNING id, first_name;")
    User.new(result[0]['first_name'], result[0]['id'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['first_name'], result[0]['id'])
  end

end