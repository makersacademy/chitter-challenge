def sign_up(username: 'chun-li',
            email: 'chun-li@streetfighter.com',
            password: 'securepassword',
            password_confirmation: 'securepassword')

  visit '/user_sign_up'
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end
