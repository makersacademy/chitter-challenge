module SessionHelpers
  def sign_up(name:                   'Mr Example',
              username:               '3xampl3',
              email:                  'example@example.com',
              password:               'qwerty',
              password_confirmation:  'qwerty')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end

  def sign_in(username:, password:)
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
