def sign_up
  visit '/user_sign_up'
  fill_in :username, with: 'chun-li'
  fill_in :email, with: 'chun-li@streetfighter.com'
  fill_in :password, with: 'securepassword'
  click_button 'Sign Up'
end
