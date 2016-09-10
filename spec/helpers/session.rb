module SessionHelpers

  def sign_up(name: "John Smith",
              username: 'chitter1',
              email: 'chitter1@testdomain.com',
              password: 'Password1',
              password_confirmation: 'Password1')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def log_in(email:, password:)
    visit '/sessions/new'
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    click_button 'Log in'
  end
end
