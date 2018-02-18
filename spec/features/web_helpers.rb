def register_new_user
  visit '/'
  click_button 'Sign Up'
  fill_in :email, with: 'example@test.com'
  fill_in :password, with: 'password123'
  fill_in :name, with: 'Test_Name'
  fill_in :username, with: 'Test_Username'
  click_button 'Sign Up'
end
