class User
  attr_reader :user_id, :username, :password, :email

  def initialize(user_id:, username:, password:, email:)
    @user_id = user_id
    @username = username
    @password = password
    @email =  email
  end
end
