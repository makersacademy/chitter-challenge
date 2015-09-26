module UserHelpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def generate_password_token
    SecureRandom.urlsafe_base64
  end
end
