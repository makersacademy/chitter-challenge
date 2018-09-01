require 'pg'

class Users

  attr_reader :name, :user_name

  def initialize(name:, user_name:)
    @name = name
    @peep = user_name
  end

  def self.create(name, user_name, email, password)
    # unique email and username check to be added
    result = database_connect.exec("INSERT INTO users (name, user_name, email, password) VALUES('#{name}', '#{user_name}', '#{email}', '#{password}') RETURNING id, name, user_name;")
    # Users.new(id: result[0]['id'], name: result[0]['name'], user_name: result[0]['user_name'])
  end

  def self.database_connect
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
