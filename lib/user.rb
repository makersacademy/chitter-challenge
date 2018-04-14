require 'pg'
require_relative './database.rb'

class User

  attr_reader :id, :name, :email, :username, :password

  def initialize(options)
    @id = options[:id]
    @name = options[:name]
    @email = options[:email]
    @username = options[:username]
    @password = options[:password]
  end

end
