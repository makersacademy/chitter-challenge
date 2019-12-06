require 'pg'

class User
  attr_reader :username, :email, :password

  def initialize(username:, email:, password:)
    @username = username
    @email = email
    @password = password
  end

  def self.create(username, email, password)
    User.new(username, email, password)
  end
end
