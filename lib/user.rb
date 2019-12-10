require 'pg'

class User

  def initialize(user_name:, user_handle:, email:, password:, created_at:, user_id:)
    @user_name = user_name
    @user_handle = user_handle
    @email = email
    @password = password
    @created_at = created_at
    @user_id = user_id
  end

  attr_reader :user_name, :user_handle, :user_id

  def self.create(user_name:, user_handle:, email:, password:)
    self.connect_to_database

    result = @connection.exec("INSERT INTO users(user_name, user_handle, email, password, created_at)
      VALUES('#{user_name}', '#{user_handle}', '#{email}', '#{password}', NOW())
      RETURNING user_name, user_handle, email, password, created_at, user_id;")

    self.new_user(result)
  end

  def self.authenticate(email:, password:)
    self.connect_to_database

    result = @connection.exec("SELECT * FROM users WHERE email = '#{email}'
      AND password = '#{password}';")

    self.new_user(result)
  rescue IndexError
    raise 'Email or password do not exist'
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

end
