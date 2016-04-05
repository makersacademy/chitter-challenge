module SessionHelpers

  def sign_up(username: 'user1',
              email: 'user1@email.com',
              password: '1234',
              password_confirmation: '1234')
    visit '/users/sign_up'
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(username:, password:)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
