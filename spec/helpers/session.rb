module SessionHelpers

  def sign_up(email, password, password_confirmation)
    visit '/users/new'
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def create_user_alice
    User.create(email: 'alice@example.com', password: 'orange', password_confirmation: 'orange')
  end

  def log_in(email, password)
    visit '/sessions/new'
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button 'Log in'
  end

end