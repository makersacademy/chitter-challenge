require_relative 'user_repository'

class LoginHelper
  def any_logged_in?(users)
    return users.any? { |user| user.logged_in }
  end

  def logged_in_user(users)
    user = users.select { |user| user.logged_in }[0]
    return nil if user == nil
    return user.id
  end

  def check_password(id, password)
    repo = UserRepository.new
    user = repo.find(id)
    return user.password == password
  end
end