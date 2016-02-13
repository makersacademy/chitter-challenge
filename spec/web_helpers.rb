def sign_up
  visit('/')
  click_button('Sign up')
  fill_in :username, with: 'marcus'
  fill_in :email, with: 'marcus@kebab.com'
  fill_in :password, with: 'kebab1'
  fill_in :password_confirmation, with: 'kebab1'
  click_button('Sign up')
end 
