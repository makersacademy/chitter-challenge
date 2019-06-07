require 'pg'

class User
  def initialize(name, user_name, email_address)
    @name = name
    @user_name = user_name
    @email_address = email_address
  end

end