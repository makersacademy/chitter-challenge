require 'pg'
require_relative 'database_connection'

class Loggedin

  def self.login(username:, password:)
      result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}' and password = '#{password}';")
      result.map do |user|
    Loggedin.new(id: user['id'], firstname: user['firstname'], username: user['username'], password: user['password'], display_pic: user['display_pic'], email: user['email'])
      end
    end

    def self.all(username:, password:)
      result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}' and password = '#{password}';")
      result.map do |bookmark|
        Loggedin.new(id: bookmark['id'], firstname: bookmark['firstname'], username: bookmark['username'], password: bookmark['password'], display_pic: bookmark['display_pic'], email: bookmark['email'])
      end
    end

def self.logout
  @id = nil
  @firstname = nil
  @username = nil
  @password = nil
  @display_pic = nil
  @email = nil
end

attr_reader :id, :firstname, :username, :password, :display_pic, :email

def self.firstname
  @firstname
end

def initialize(id:, firstname:, username:, password:, display_pic:, email:)
    @id = id
    @firstname = firstname
    @username = username
    @password = password
    @display_pic = display_pic
    @email = email
  end
end
