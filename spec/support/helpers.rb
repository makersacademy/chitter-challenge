module Helpers

  def sign_up(user)
    visit ('/')
    click_button 'Sign up'
    fill_in 'email',    with: user.email
    fill_in 'name',     with: user.name
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    fill_in 'password_confirmation', with: user.password_confirmation
    click_button 'Register'
  end

  def log_in(user)
    visit ('/')
    click_button 'Log in'
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'Enter'
  end

end