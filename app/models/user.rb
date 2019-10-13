class User < ActiveRecord::Base
  def authenticate(attempt)
    password.check(attempt)
  end

  private

  def password
    UserPassword.find_by(user_id: id)
  end
end