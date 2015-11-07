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
  fill_in :email, with: 'David.Wright123@gmail.com'
  fill_in :username, with: 'DWright'
  fill_in :password, with: 'letmein'
  fill_in :password_confirmation, with: 'letmein'
  click_button 'Submit'
end
