

  def sign_up(email: 'scott@example.com',
             password: 'STARBURST',
             password_confirmation: 'STARBURST')
   visit '/users/new'
   fill_in :email, with: email
   fill_in :password, with: password
   fill_in :password_confirmation, with: password_confirmation
   click_button 'Sign up'
  end
