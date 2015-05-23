module SessionHelpers

  def sign_up(email = 'test@test.com', password = 'oranges!', 
    password_confirmation = 'oranges!', name = 'Tim', username = 'username')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :name, with: name
    fill_in :username, with: username
    click_button 'Sign up'
  end

  def sign_in(email, password)
    visit '/sessions/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign in'
  end


end