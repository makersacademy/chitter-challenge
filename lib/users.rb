require 'pg'

class Users

  attr_reader :id, :name, :user_name

  def initialize(id:, name:, user_name:)
    @id = id
    @name = name
    @user_name = user_name
  end

  def self.create(name, user_name, email, password)
    result = database_connect.exec("INSERT INTO users (name, user_name, email, password) VALUES('#{name}', '#{user_name}', '#{email}', '#{password}') RETURNING id, name, user_name;")
    # Users.new(id: result[0]['id'], name: result[0]['name'], user_name: result[0]['user_name'])
  end

  def self.select_user(user_name)
    result = database_connect.exec("SELECT id, name, user_name FROM users")
    result.map do |user|
      return Users.new(id: user['id'], name: user['name'], user_name: user['user_name']) if user.values[2] == user_name
    end
  end

  def self.unique_input_checker(option, checking_key)
    result = database_connect.exec("SELECT #{checking_key} FROM users;")
    result.map do |items|
      return true if items.values[0] == option
    end
    false
  end

  def self.log_in_checker(user_name, password)
    result = database_connect.exec("SELECT user_name, password FROM users;")
    result.map do |items|
      return true if items.values[0] == user_name && items.values[1] == password
    end
    false
  end

  private

  def self.database_connect
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
