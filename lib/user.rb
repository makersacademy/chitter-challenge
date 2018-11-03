require 'bcrypt'
require_relative './database_connection'
class User

  attr_reader :id, :name, :email

  def initialize(id:, name:, email:)
  @id = id
  @name = name
  @email = email
  #@password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    resuls.map { |user| User.new(user['id'], user['name'], user['email'], user['password']) }
  end

  def self.create(options)
    password = BCrypt::Password.create(options[:password])

    result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES('#{options[:name]}', '#{options[:email]}', '#{password}') RETURNING id, name, email")

    # result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES('#{id}', '#{name}', '#{email}', '#{password}') RETURNING id, name, email;")
    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      email: result[0]['email'],
      #password: result[0]['password']
    )
    end

    def self.find(id:)
   return nil unless id
   result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
   User.new(
     id: result[0]['id'],
     name: result[0]['name'],
     email: result[0]['email'],
     #password: result[0]['password']
   )
 end

 def self.authenticate(name:, password:)
   result = DatabaseConnection.query("SELECT * FROM users WHERE name = '#{name}'")
   return unless result.any?
   return unless BCrypt::Password.new(result[0]['password']) == password
   User.new(
     id: result[0]['id'],
     name: result[0]['name'],
     email: result[0]['email'],
     #password: result[0]['password']
   )
 end
end
