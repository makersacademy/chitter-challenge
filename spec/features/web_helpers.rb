def sign_up
  visit '/users/new'
  fill_in :email, with: 'dylan@bossman.com'
  fill_in :password, with: 'bossman'
  fill_in :password_confirmation, with: 'bossman'
  fill_in :username, with: 'dylanrhodius'
  fill_in :name, with: 'dylan'
  click_button 'Sign Up'
end

def wrong_sign_up
  visit '/users/new'
  fill_in :email, with: 'dylan@bossman.com'
  fill_in :password, with: 'bossman'
  fill_in :password_confirmation, with: 'wrong_password_confirmation'
  fill_in :username, with: 'dylanrhodius'
  fill_in :name, with: 'dylan'
  click_button 'Sign Up'
end
