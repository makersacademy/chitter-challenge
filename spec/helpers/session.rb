module SessionHelpers
  def sign_up(user)
    visit '/'
    click_button 'Sign up'
    fill_in :email,     with: user.email
    fill_in :password,  with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    fill_in :name,      with: user.name
    fill_in :username,  with: user.username
    click_button 'Register'
  end

  def sign_in(user)
    visit '/sessions/new'
    click_button 'Sign in'
    fill_in 'email',    with: user.email
    fill_in 'password', with: user.password
    click_button 'Sign in'
  end

end
