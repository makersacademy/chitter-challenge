require 'pg'
#require 'database_connection'

class User
  attr_reader :id, :name, :username, :email

  def initialize(id: ,name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps_manager')
    end
    result = connection.exec ("INSERT INTO users (name, username, email, password) VALUES('#{name}','#{username}','#{email}', '#{password}') RETURNING user_id, name, username, email;")
    User.new(id: result[0]['user_id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end

  # def self.find(username)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'peeps_test')
  #   else
  #     connection = PG.connect(dbname: 'peeps_manager')
  #   end
  #   return nil unless username
  #   result = connection.exec ("SELECT * FROM users WHERE username = '#{username}'")
  #   User.new(result[0]['user_id'], result[0]['name'], result[0]['username'], result[0]['email'])
  # end


end
