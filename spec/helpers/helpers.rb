module ChitterHelpers

  def sign_up(name: 'Shane',
              username: 'Shane',
              email: 'test@test.com',
              password: 'password',
              password_confirmation: 'password'
              )
    visit '/'
    click_link 'Sign up'
    fill_in :name,                  with: name
    fill_in :username,              with: username
    fill_in :email,                 with: email
    fill_in :password,              with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(username:, password:)
    visit '/'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Log in'
  end

end
