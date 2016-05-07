module SessionHelpers

  def sign_up(name: 'Marley',
              username: 'Luni',
              email: 'marley@cat.com',
              password: 'dreamies',
              password_confirmation: 'dreamies')
      visit '/users/new'
      fill_in :name, with: name
      fill_in :username, with: username
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign up'
  end

  def log_in(name:, username:, email:, password:)
    visit '/sessions/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log in'
  end

end
