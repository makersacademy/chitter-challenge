def sign_in
  visit '/users/new'
  fill_in 'username', with: 'SexyClownfish'
  fill_in 'email', with: 'mike@aol.com'
  fill_in 'password', with: 'password'
  click_button 'Create new user'
end
