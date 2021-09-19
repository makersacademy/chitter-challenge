require_relative '../db/queries/postgres_db'
require 'bcrypt'
require 'dotenv'

class User

  Dotenv.load

  def self.add(username:, email:, password:)
    result = PGDatabase.create_user(username: username, email: email, password: encrypt(password))
    User.new(id: result['id'], username: result['id'], email:result['id'])
  end

  def self.get(id)
    return nil unless id
    result = PGDatabase.get_user(id)
    User.new(id: result['id'], username: result['user_name'], email:result['email'])
  end

  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

  private_class_method :encrypt

  def initialize(id:, username:, email: )
    @id = id
    @username = username
    @email = email
  end

  attr_reader :id, :username, :email

end