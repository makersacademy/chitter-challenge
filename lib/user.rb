class User

  attr_reader :user_id, :name, :username, :email, :password

  def initialize(user_id:, name:, username:, email:, password:)
    @user_id = user_id
    @name = name
    @username = username
    @email = email
    @password = password
  end
end
