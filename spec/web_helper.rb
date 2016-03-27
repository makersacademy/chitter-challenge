module Helpers
  def sign_up(name: 'jon',
              username: 'ghost',
              email: 'jon_snow@nightswatch.com',
              password: 'ygritte',
              password_confirmation: 'ygritte')

              visit('/users/new')
              fill_in('name', with: name)
              fill_in('username', with: username)
              fill_in('email', with: email)
              fill_in('password', with: password)
              fill_in('password_confirmation', with: password_confirmation)
              click_button('Sign up')

  end

  def sign_in(email: 'jon_snow@nightswatch.com', password: 'ygritte')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
