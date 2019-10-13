class User < ActiveRecord::Base
  def authenticate(attempt)
    password.check(attempt)
  end

  private

  def password
    user_password_class.find_by(user_id: id)
  end

  def user_password_class
    UserPassword
  end
end