def valid_sign_up
  visit '/signup'
  fill_in :name, with: 'David Wright'
  fill_in :email, with: 'David.Wright@gmail.com'
  fill_in :username, with: 'DWright'
  fill_in :password, with: 'letmein'
  fill_in :password_confirmation, with: 'letmein'
  click_button 'Submit'
end

def sign_up_with_same_username
  visit '/signup'
  fill_in :name, with: 'David Wright'
  fill_in :email, with: 'David.Wright1@gmail.com'
  fill_in :username, with: 'DWright'
  fill_in :password, with: 'letmein'
  fill_in :password_confirmation, with: 'letmein'
  click_button 'Submit'
end

def sign_up_without_name
  visit '/signup'
  fill_in :name, with: ''
  fill_in :email, with: 'David.Wright12@gmail.com'
  fill_in :username, with: 'DWright1'
  fill_in :password, with: 'letmein'
  fill_in :password_confirmation, with: 'letmein'
  click_button 'Submit'
end

def sign_up_without_email
  visit '/signup'
  fill_in :name, with: 'David Wright'
  fill_in :email, with: ''
  fill_in :username, with: 'DWright12'
  fill_in :password, with: 'letmein'
  fill_in :password_confirmation, with: 'letmein'
  click_button 'Submit'
end

def sign_up_without_username
  visit '/signup'
  fill_in :name, with: 'David Wright'
  fill_in :email, with: 'David.Wright123@gmail.com'
  fill_in :username, with: ''
  fill_in :password, with: 'letmein'
  fill_in :password_confirmation, with: 'letmein'
  click_button 'Submit'
end

def sign_up_without_password
  visit '/signup'
  fill_in :name, with: 'David Wright'
  fill_in :email, with: 'David.Wright1234@gmail.com'
  fill_in :username, with: 'DWright123'
  fill_in :password, with: ''
  fill_in :password_confirmation, with: 'letmein'
  click_button 'Submit'
end

def sign_up_without_password_confirmation
  visit '/signup'
  fill_in :name, with: 'David Wright'
  fill_in :email, with: 'David.Wright12345@gmail.com'
  fill_in :username, with: 'DWright1234'
  fill_in :password, with: 'letmein'
  fill_in :password_confirmation, with: ''
  click_button 'Submit'
end

def sign_up_without_passwords_matching
  visit '/signup'
  fill_in :name, with: 'David Wright'
  fill_in :email, with: 'David.Wright123456@gmail.com'
  fill_in :username, with: 'DWright12345'
  fill_in :password, with: 'letmein'
  fill_in :password_confirmation, with: 'letmein1'
  click_button 'Submit'
end
