require 'pg'
require 'bcrypt'

class User

  def initialize(user_name:, user_handle:, email:, password:, created_at:, user_id:)
    @user_name = user_name
    @user_handle = user_handle
    @email = email
    @password = password
    @created_at = DateTime.parse(created_at)
    @user_id = user_id
  end

  attr_reader :user_name, :user_handle, :user_id

  def self.create(user_name:, user_handle:, email:, password:)
    encrypted_psw = BCrypt::Password.create(password)

    return :email_clash if email_exists?(email)
    return :handle_clash if handle_exists?(user_handle)

    connect_to_database

    result = @connection.exec("INSERT INTO users(user_name, user_handle, email,
      password)
      VALUES('#{user_name}', '#{user_handle}', '#{email}', '#{encrypted_psw}')
      RETURNING user_name, user_handle, email, password, created_at, user_id;")

    new_user(result)
  end

  def self.authenticate(email:, password:)
    connect_to_database

    result = @connection.exec("SELECT * FROM users WHERE email = '#{email}';")
    return false unless result.any?
    return false unless BCrypt::Password.new(result[0]["password"]) == password

    new_user(result)
  end

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test_database')
    else
      @connection = PG.connect(dbname: 'chitter_database')
    end
  end

  def self.new_user(result)
    User.new(user_name: result[0]['user_name'], user_handle: result[0]['user_handle'],
      email: result[0]['email'], password: result[0]['password'],
      created_at: result[0]['created_at'], user_id: result[0]['user_id'])
  end

  def self.email_exists?(email)
    connect_to_database
    result = @connection.exec("SELECT user_id FROM users WHERE email = '#{email}';")
    return true if result.any?
  end

  def self.handle_exists?(user_handle)
    connect_to_database
    result = @connection.exec("SELECT user_id FROM users WHERE user_handle = '#{user_handle}';")
    return true if result.any?
  end

end
