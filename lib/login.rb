require 'dm-validations'
require_relative 'message'

class Login

  def self.exists?(username)
    !!User.first(:username => username)
  end
  # def self.succesful?(username, password)
  #
  #
  # end
  def self.valid?(username, password)
    user = User.first(:username => username)
    !(user.password != password)
  end
    # attr_accessor :password_confirmation
    # attr_accessor :email_repeated
    #
    # validates_confirmation_of :password
    # validates_confirmation_of :email, :confirm => :email_repeated

    # a call to valid? will return false unless:
    # password == password_confirmation
    # and
    # email == email_repeated
end
