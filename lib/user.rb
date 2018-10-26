class User

  attr_reader :name, :email, :user_name, :password

  def initialize(name, email, user_name, password)
    @name = name
    @email = email
    @user_name = user_name
    @password = password
  end


end
