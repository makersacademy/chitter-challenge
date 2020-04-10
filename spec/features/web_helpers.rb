def sign_up
  visit '/users/new'
  fill_in 'name', with: 'Phil'
  fill_in 'username', with: 'Squirrel'
  fill_in 'email', with: 'here@there.com'
  fill_in 'password', with: '1234'
  click_button 'Submit'
end
