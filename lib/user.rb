require 'pg'
require 'pry'

class User

  attr_accessor :email, :password, :name, :handle

  def initialize(email, password, name, handle)
    @email = email
    @password = password
    @name = name
    @handle = handle
  end

end
