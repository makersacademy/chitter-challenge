require 'bcrypt'

class User
  attr_reader :id, :name

  def initialize(id, username, name, email, password)
    @id = id
    @username = username
    @name = name
    @email = email
    @password = password
  end

  def self.create(username, name, email, password)
    encrypted_password = BCrypt::Password.create(password)
    result = store_in_database(username, name, email, encrypted_password)
    create_new_user(result)
  end

  def self.find(id)
    return nil unless id
    result = fetch_from_database('id', id)
    create_new_user(result.first)
  end

  def self.authenticate(email, password)
    result = fetch_from_database('email', email)
    return unless result.any?
    return unless BCrypt::Password.new(result.first['password']) == password
    create_new_user(result.first)
  end

  def self.store_in_database(username, name, email, encrypted_password)
    DatabaseConnection.query(
      "INSERT INTO users (username, name, email, password) " +
      "VALUES ('#{username}', '#{name}', '#{email}', '#{encrypted_password}')" +
      " RETURNING id, username, name, email, password;"
    ).first
  end

  def self.fetch_from_database(field, value)
    DatabaseConnection.query(
      "SELECT * FROM users WHERE #{field} = '#{value}'")
  end

  def self.create_new_user(result)
    User.new(
      result['id'],
      result['username'],
      result['name'],
      result['email'],
      result['password']
    )
  end
end
