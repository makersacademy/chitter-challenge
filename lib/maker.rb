require 'pg'

class Maker

  attr_reader :email, :password, :name, :username

  def initialize(email:, password:, name:, username:)
    @email = email
    @password = password
    @name = name
    @username = username
  end
end
