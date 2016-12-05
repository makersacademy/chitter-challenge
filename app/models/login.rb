require "bcrypt"

class Login
  def initialize(user_model)
    @user_model = user_model || User
  end

  def user(email, password)
    user = user_model.first(email: email)
    if user && BCrypt::Password.new(user.password_digest)== password
      user
    end
  end

  private

  attr_reader :user_model
end
