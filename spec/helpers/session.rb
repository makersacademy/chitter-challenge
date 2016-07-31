module SessionHelpers

  def sign_up(full_name: 'Alwin Solanky',
              username: 'alwins',
              email: 'alwins@gmail.com',
              password: 'password123',
              password_confirmation: 'password123')
    visit '/users/new'
    fill_in :full_name, with: full_name
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
    click_button 'sign in'
  end

end
