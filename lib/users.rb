require_relative '../db/queries/postgres_db'
require 'bcrypt'
require 'dotenv'

class User

  Dotenv.load

  def self.add(username:, email:, password:)
    result = PGDatabase.create_user(username: username, email: email, password: encrypt(password))
    User.new(id: result['id'], username: result['username'], email:result['email'])
  end

  def self.get(id)
    return nil unless id
    result = PGDatabase.get_user(value: id, idendifier: :id)
    User.new(id: result['id'], username: result['user_name'], email:result['email'])
  end

  def self.auth(email: , password: )
    result = PGDatabase.get_user(value: email, idendifier: :email)
    pepper_pass = ENV['PEPPER'] + password
  
    p BCrypt::Password.new(result['password']) == pepper_pass

    if result && BCrypt::Password.new(result['password']) == pepper_pass
      User.new(id: result['id'], username: result['username'], email: result['email'])
    else
      return
    end
  end

  def self.encrypt(password)
    BCrypt::Password.create(ENV['PEPPER'] + password)
  end

  private_class_method :encrypt

  def initialize(id:, username:, email: )
    @id = id
    @username = username
    @email = email
  end

  attr_reader :id, :username, :email

end