require_relative 'user_repository'

class LoginHelper
  def initialize(users)
    @users = users
  end

  def any_logged_in?
    return @users.any? { |user| user.logged_in == 't' }
  end

  def login(user)
    fail 'A user is already logged in' if any_logged_in?
    repo = UserRepository.new
    repo.change_login_status(user.id)
  end

  def logged_in_user
    user = @users.select { |user| user.logged_in }[0]
    return nil if user == nil
    return user.id
  end

  def logout(user)
    fail 'User is not logged in' if user.logged_in == false
    repo = UserRepository.new
    repo.update_login_status(user)
  end
end