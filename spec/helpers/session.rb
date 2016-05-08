module SessionHelpers

  def sign_up(name: 'Marley',
              username: 'Luni',
              email: 'marley@cat.com',
              password: 'dreamies',
              password_confirmation: 'dreamies')
      visit '/peeps'
      click_button 'Sign up'
      fill_in :name, with: name
      fill_in :username, with: username
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Confirm'
  end

  def log_in(username:, password:)
    visit '/peeps'
    click_button 'Log in'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Confirm'
  end

end
