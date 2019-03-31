require 'bcrypt'

class User
  attr_reader :id, :username
  def initialize(id:, email:, first_name:, surname:, username:)
    @id = id
    @email = email
    @first_name = first_name
    @surname = surname
    @username = username
  end

  def self.create(email:, password:, first_name:, surname:, username:)
    unique_check = DatabaseConnection.query("SELECT 1 FROM users where username = '#{username}' OR email = '#{email}'")

    return if unique_check.any?

    encrypted_password = BCrypt::Password.create(password)
    results = DatabaseConnection.query("INSERT INTO users (email, password, first_name, surname, username) VALUES ('#{email}', '#{encrypted_password}', '#{first_name}', '#{surname}', '#{username}') RETURNING id, email, first_name, surname, username;")
    User.new(id: results[0]['id'], email: results[0]['email'], first_name: results[0]['first_name'], surname: results[0]['surname'], username: results[0]['username'])
  end

  def self.authenticate(username:, password:)
    results = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")

    return if results.ntuples.zero?
    return if BCrypt::Password.new(results[0]['password']) != password

    User.new(id: results[0]['id'], email: results[0]['email'], first_name: results[0]['first_name'], surname: results[0]['surname'], username: results[0]['username'])
  end
end
