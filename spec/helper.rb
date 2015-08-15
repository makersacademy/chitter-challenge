module Helper
  def sign_up(user)
    visit '/user/new'
    fill_in 'username', with: user.username
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    fill_in 'password_confirmation', with: user.password_confirmation
    click_button 'Sign up'
  end

  def sign_in(username: user.username, password: user.password)
    visit '/session/new'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Sign in'
  end
end