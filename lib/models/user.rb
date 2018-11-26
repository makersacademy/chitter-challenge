require_relative '../database_connection'
require 'bcrypt'
class User
  def self.create(name:, email:, user_name:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users
                                      (user_name, email, password, name)
                                      VALUES
                                      ('#{user_name}','#{email}',
                                       '#{encrypted_password}',
                                       '#{name}') RETURNING
                                       id,user_name,
                                       email,password, name;").first
    build_user(result)
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users
                                       WHERE id = '#{id}'").first
    build_user(result)
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users
                                      WHERE email = '#{email}'").first
    if result && BCrypt::Password.new(result['password']) == password
      build_user(result)
    else
      nil
    end
  end

  def self.build_user(result)
    User.new(id: result['id'],
             name: result['name'],
             email: result['email'],
             user_name: result['user_name'])
  end

  attr_reader :id, :name, :email, :user_name

  def initialize(id:, name:, email:, user_name:)
    @id = id
    @name = name
    @email = email
    @user_name = user_name
  end
end
