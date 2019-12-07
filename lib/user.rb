require_relative 'login_information'

class User
  attr_reader :username, :email, :password

  def initialize username, email, password, login_class = LoginInformation
    @login = login_class.new email, password
    @username = username
    @email = @login.email
    @password = @login.password
  end
end
