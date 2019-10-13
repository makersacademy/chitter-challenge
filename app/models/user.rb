class User < ActiveRecord::Base
  def authenticate(password)
    user_password_class.check(password: password, salt: self.salt, passhash: self.passhash )
  end

  private

  def user_password_class
    UserPassword
  end
end