require 'pg'

class User
  attr_reader: :user_name, :user_id

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

    results = connection.exec("INSERT INTO users (user_name, password) VALUE ('#{user_name}', '#{password}' RETURNING user_id, user_name;")

    User.new()

  end
end
