require 'pg'

class Users

  attr_reader :id, :name, :user_name

  def initialize(id:, name:, user_name:)
    @id = id
    @name = name
    @peep = user_name
  end

  def self.create(name, user_name, email, password)
    result = database_connect.exec("INSERT INTO users (name, user_name, email, password) VALUES('#{name}', '#{user_name}', '#{email}', '#{password}') RETURNING id, name, user_name;")
    # Users.new(id: result[0]['id'], name: result[0]['name'], user_name: result[0]['user_name'])
  end

  def self.unique_input_checker(option, checking_key)
    result = database_connect.exec("SELECT #{checking_key} FROM users;")
    result.map do |items|
      return true if items.values[0] == option
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
