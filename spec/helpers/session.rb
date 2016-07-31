# You had to require this in spec_helper

module SessionHelpers

  def sign_up(username: 'Jonny',
              email: 'jonny@email.com',
              password: 'somepassword',
              password_confirmation: 'somepassword')
    visit '/signup'
    fill_in 'username', with: username
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_button 'Sign up to Chitter'
  end

  def log_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log in'
  end

end
