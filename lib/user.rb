require 'pg'
require_relative 'database_connection'

class User

  def initialize(id:, firstname:, username:, password:, display_pic:, email:)
      @id = id
      @firstname = firstname
      @username = username
      @password = password
      @display_pic = display_pic
      @email = email
    end

    def self.all
      result = DatabaseConnection.query("SELECT * FROM users;")
      result.map do |users|
        User.new(id: users['id'], firstname: users['firstname'], username: users['username'], password: users['password'], display_pic: users['display_pic'], email: users['email'])
      end
    end

def self.signup(firstname:, username:, password:, display_pic:, email:)
      result = DatabaseConnection.query("INSERT INTO users (firstname, username, password, display_pic, email)
        VALUES('#{firstname}', '#{username}', '#{password}', '#{display_pic}', '#{email}')
        RETURNING id, firstname, username, password, display_pic, email")
      User.new(id: result[0]['id'], firstname: result[0]['firstname'], username: result[0]['username'], password: result[0]['password'], display_pic: result[0]['display_pic'], email: result[0]['email'])
    end
end
