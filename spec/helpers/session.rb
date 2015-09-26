module SessionHelpers

  def sign_up(user)
    visit '/sessions/sign_up'
    fill_in :username, with: user.username
    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

  def sign_in(user)
    visit('sessions/new')
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_button 'Sign in'
  end

  def sign_out
    visit('/')
    click_button 'Sign out'
  end

end






