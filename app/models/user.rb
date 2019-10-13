class User < ActiveRecord::Base
  def authenticate(attempt)
    password.check(attempt)
  end

  def tags
    tags = Tag.user_tags(id)
    return nil unless tags.length > 0

    tags
  end

  private

  def password
    user_password_class.find_by(user_id: id)
  end

  def user_password_class
    UserPassword
  end
end