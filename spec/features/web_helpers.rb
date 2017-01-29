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

def no_email
  visit '/users/new'
  fill_in :password, with: 'bossman'
  fill_in :password_confirmation, with: 'wrong_password_confirmation'
  fill_in :username, with: 'dylanrhodius'
  fill_in :name, with: 'dylan'
  click_button 'Sign Up'
end

def wrong_email_format
  visit '/users/new'
  fill_in :email, with: 'dylanbossman.com'
  fill_in :password, with: 'bossman'
  fill_in :password_confirmation, with: 'wrong_password_confirmation'
  fill_in :username, with: 'dylanrhodius'
  fill_in :name, with: 'dylan'
  click_button 'Sign Up'
end

def sign_in
  visit '/sessions/new'
  fill_in :email,    with: 'dylan@bossman.com'
  fill_in :password, with: 'bossman'
  click_button 'Sign In'
end

def post_peep
  sign_up
  sign_in
  visit '/chitter/new'
  fill_in :message, with: "Peeping!"
  click_button 'Peep!'
end
