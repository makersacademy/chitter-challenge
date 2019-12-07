class LoginInformation
  attr_reader :username, :password

  def initialize username, password
    @username = username
    @password = password
  end

  def authenticate username_entry, password_entry
    username == username_entry && password == password_entry
  end
end
