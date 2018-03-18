require 'pg'
require 'uri'
require_relative 'database_connection.rb'
require_relative 'validate.rb'
require_relative 'peep.rb'
require 'argon2'
require_relative 'email_sender.rb'

class User

  attr_reader :email, :peeps, :password_hash

  def initialize(email, password_hash)
    @email = email
    @password_hash = password_hash
    @peeps = []
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['email'], user['password_hash'])}
  end

  def self.create(email, password)
    return 0 unless Validate.email(email)
    return 1 if self.find(email) != nil
    DatabaseConnection.query("INSERT INTO users (email, password_hash) VALUES ('#{email}', '#{Argon2::Password.create(password)}');")
  end

  def self.find(email)
    self.all.select { |user| user.email == email }[0]
  end

  def post(text)
    DatabaseConnection.query("INSERT INTO peeps (email, text, dt) VALUES ('#{self.email}', '#{text}', '#{Time.new}');")
    @peeps.push(Peep.new(text, email, Time.new))
  end
end
