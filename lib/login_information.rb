class LoginInformation
  attr_reader :email, :password

  def initialize email, password
    @email = email
    @password = password
  end

  def authenticate email_entry, password_entry
    email == email_entry && password == password_entry
  end
end
