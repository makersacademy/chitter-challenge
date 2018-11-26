require 'pg'
require 'bcrypt'

class User
  attr_reader :user_name, :user_id

  def initialize(user_name, user_id)
    @user_name = user_name
    @user_id = user_id
  end

  def self.sign_up(user_name, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    encrypted_password = BCrypt::Password.create(password)

    User.user_name_available?(user_name)

    results = connection.exec("INSERT INTO users (user_name, password) VALUES ('#{user_name}', '#{encrypted_password}') RETURNING user_name, user_id;")

    User.new(results[0]['user_name'], results[0]['user_id'])
  end

  def self.user_name_available?(user_name)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM users WHERE user_name = '#{user_name}';")

    fail "User already exists" if result.first != nil
  end

  def self.login(user_name, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    encrypted_password = BCrypt::Password.create(password) #might not be right way of checkin


    user = connection.exec("SELECT * FROM users WHERE user_name = '#{user_name}' AND;")

  end

end
