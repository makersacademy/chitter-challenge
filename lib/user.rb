require 'pg'
class User
  attr_reader :id, :email, :username, :first_name, :last_name, :password

  def initialize(id, email, username, name, password)
    @id = id
    @email = email
    @username = username
    @name = name
    @password = password
  end

  def self.all

  end
end
