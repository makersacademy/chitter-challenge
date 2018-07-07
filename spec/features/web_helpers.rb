def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in :name, with: 'Daniel'
  fill_in :username, with: 'dlau'
  fill_in :email, with: 'abc@abc.com'
  fill_in :password, with: '1234'
  click_button 'Sign Up'
end
