module UserHelpers

  def add_user(user)
    User.create(email: user.email,
                password: user.password,
                password_confirmation: user.password_confirmation,
                real_name: user.real_name,
                user_name: user.user_name)
  end

  # def user_sign_up(user)
  #
  # end
  #
  # def user_sign_in(user)
  #
  # end
  #
  # def user_sign_out(user)
  #
  # end

end
