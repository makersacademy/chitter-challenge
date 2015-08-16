module Helpers

  def sign_up(user)
    visit('/users/new')
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    fill_in('password_confirmation', with: user.password_confirmation)
    fill_in('name', with: user.name)
    fill_in('user_name', with: user.user_name)
    click_button('Sign up')
  end

  def sign_in(user)
    visit('/sessions/login')
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_button('Log in')
  end

end