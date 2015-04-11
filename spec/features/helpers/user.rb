module UserHelpers

  def sign_up email = 'sanjsanj@hotmail.com',
              password = 'password', password_confirmation = 'password',
              user_name = 'Sanjay Purswani', user_handle = 'sanjsanj'
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :user_name, with: user_name
    fill_in :user_handle, with: user_handle
    click_button 'Sign up'
  end

  def sign_in email = 'sanjsanj@hotmail.com', password = 'password'
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_out
    visit '/'
    click_button 'Sign out'
  end

end
