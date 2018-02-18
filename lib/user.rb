
require 'pg'
require 'uri'
require './lib/database_connection'


class User

  attr_reader :name, :password

  def initialize(name, password)
    @name = name
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM newuser")
    result.map { |user| User.new(user['name'], user['password']) }
  end

  def self.sign_in(name, password)
    raise "This user already exists!" if user_exists?(name)
   DatabaseConnection.query("INSERT INTO newuser(name, password) VALUES('#{name}', '#{password}')")
  end

private

  def self.user_exists?(name)
    result = DatabaseConnection.query("SELECT * FROM newuser")
    result.map { |user| user['name'] }.include?(name)
  end

end
