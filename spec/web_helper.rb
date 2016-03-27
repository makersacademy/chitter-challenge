def sign_up_correctly
  visit '/'
  click_button 'Sign up'
  fill_in :username, with: 'Marty'
  fill_in :email, with: 'martymcfly@future.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end

def sign_up_mismatch_passwords
  visit '/'
  click_button 'Sign up'
  fill_in :username, with: 'Marty'
  fill_in :email, with: 'martymcfly@future.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'not_matching'
  click_button 'Sign up'
end

def sign_up_no_email
  visit '/'
  click_button 'Sign up'
  fill_in :username, with: 'Marty'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end

def sign_up_invalid_email
  visit '/'
  click_button 'Sign up'
  fill_in :username, with: 'Marty'
  fill_in :email, with: 'martymcfly@future'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end

def sign_up_same_email
  visit '/'
  click_button 'Sign up'
  fill_in :username, with: 'Marty'
  fill_in :email, with: 'martymcfly@future.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
  visit '/'
  click_button 'Sign up'
  fill_in :username, with: 'Martie'
  fill_in :email, with: 'martymcfly@future.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end
