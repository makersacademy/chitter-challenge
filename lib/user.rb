require_relative 'database_connection'
require 'uri'

class User
  attr_reader :username, :password

  def initialize(username, password)
    @username = username
    @password = password
  end

  def self.create
    User.new(@username, @password)
  end
end
