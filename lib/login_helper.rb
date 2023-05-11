
class LoginHelper
  def initialize(users)
    @users = users
  end

  def any_logged_in?
    return @users.any? { |user| user.logged_in }
  end

  def login(user)
    fail 'A user is already logged in' if any_logged_in?
    user.logged_in = true
  end

  def logged_in_user
    user = @users.select { |user| user.logged_in }[0]
    return nil if user == nil
    return user.id
  end

  def logout(user)
    fail 'User is not logged in' if user.logged_in == false
    user.logged_in = false
  end
end