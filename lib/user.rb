require 'pg'

class User
  attr_reader :username

  def initialize(username, password = nil)
    @username = username
    @password = password


end
