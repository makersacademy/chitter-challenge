require 'pg'

class User

  def initialize(user_name:, user_handle:, email:, password:, created_at:, user_id:)
    @user_name = user_name
    @user_handle = user_handle
    @email = email
    @password = password
    @created_at = created_at
    @user_id = id
  end

  attr_reader :user_name, :user_handle, :id

  def self.create(user_name:, user_handle:, email:, password:)
    # if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test_database')
    # else
    #   connection = PG.connect(dbname: 'chitter_database')
    # end
    result = connection.exec("INSERT INTO users(user_name, user_handle, email, password, created_at)
      VALUES('#{user_name}', '#{user_handle}', '#{email}', '#{password}', NOW())
      RETURNING user_name, user_handle, email, password, created_at, user_id;")
    User.new(user_name: result[0]['user_name'], user_handle: result[0]['user_handle'],
      email: result[0]['email'], password: result[0]['password'],
      created_at: result[0]['created_at'], user_id: result[0]['user_id'])
  end
end
