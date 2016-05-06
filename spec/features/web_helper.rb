def sign_up
  visit '/users/new'
  fill_in :name, with: 'User McUser'
  fill_in :user_name, with: 'alias'
  fill_in :email, with: 'user@test.com'
  fill_in :password, with: 'user123'
  fill_in :password_confirmation, with: 'user123'
  click_button 'Sign up!'
end

def sign_up_wrong_passwords
  visit '/users/new'
  fill_in :name, with: 'User McUser'
  fill_in :user_name, with: 'alias'
  fill_in :email, with: 'user@test.com'
  fill_in :password, with: 'user123'
  fill_in :password_confirmation, with: 'NOT_CORRECT'
  click_button 'Sign up!'
end

def no_email
  visit '/users/new'
  fill_in :name, with: 'User McUser'
  fill_in :user_name, with: 'alias'
  fill_in :email, with: ''
  fill_in :password, with: 'user123'
  fill_in :password_confirmation, with: 'user123'
  click_button 'Sign up!'
end

def invalid_email
  visit '/users/new'
  fill_in :name, with: 'User McUser'
  fill_in :user_name, with: 'alias'
  fill_in :email, with: 'hej@hej'
  fill_in :password, with: 'user123'
  fill_in :password_confirmation, with: 'user123'
  click_button 'Sign up!'
end
