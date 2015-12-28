module SessionHelpers
  def sign_up(user)
    visit '/users/new'
    within('#new_user') do
      fill_in :name, with: user.name
      fill_in :username, with: user.username
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      fill_in :password_confirmation, with: user.password_confirmation
    end
  end

  def log_in(username, password)
    visit '/'
    within('#login_bar') do
      fill_in :username, with: username
      fill_in :password, with: password
      click_button 'Sign in'
    end
  end
end
