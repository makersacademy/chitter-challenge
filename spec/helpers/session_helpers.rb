module SessionHelpers

  def sign_up(email: 'user@user.com',
              password: 'pass',
              password_confirmation: 'pass',
              username: '@user')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :username, with: username
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit 'sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
