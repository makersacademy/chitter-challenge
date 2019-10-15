def user_sign_up
  visit '/users/new'
  fill_in :email, with: 'test@example.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  fill_in :name, with: 'Test Name'
  fill_in :username, with: 'Test'
  click_button('Submit')
end
