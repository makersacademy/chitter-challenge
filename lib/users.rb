require_relative '../database_connection_setup'
require 'pg'

class Users

  def self.create(username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
    else
        connection = PG.connect(dbname: 'chitter')
    end
    new_user = connection.exec("INSERT INTO users(username, email, password) VALUES('#{username}','#{email}','#{password}') RETURNING id, username, email;")
    Users.new(id: new_user[0]['id'],
      username: new_user[0]['username'],
      email: new_user[0]['email'])
  end

  def self.find(id)
      return nil unless id
      if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
      else
          connection = PG.connect(dbname: 'chitter')
      end
      result = connection.exec("SELECT * FROM users WHERE id = #{id}")
      Users.new(
        id: result[0]['id'],
        username: result[0]['username'],
        email: result[0]['email'])
    end

     attr_reader :id, :email, :username

     def initialize(id:, email:, username:)
      @id = id
      @email = email
      @username = username
    end
end
