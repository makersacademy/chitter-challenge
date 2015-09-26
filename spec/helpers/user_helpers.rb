module UserHelpers

  def add_user(user)
    user_params = { email: user.email,
                    password: user.password,
                    password_confirmation: user.password_confirmation,
                    real_name: user.real_name,
                    user_name: user.user_name }
    new_user = User.create(user_params)
    new_user.errors.full_messages
  end

end
