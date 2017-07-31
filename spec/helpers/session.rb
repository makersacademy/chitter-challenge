module SessionHelpers

  def sign_up(username: 'Barney',
              email: 'barney@barney.com',
              password: '4567',
              password_confirmation: '4567')
    visit '/users/new'
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Register'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
