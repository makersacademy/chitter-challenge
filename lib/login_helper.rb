
class LoginHelper
  def initialize(users)
    @users = users
  end

  def any_logged_in?
    return @users.any? { |user| user.logged_in }
  end
end