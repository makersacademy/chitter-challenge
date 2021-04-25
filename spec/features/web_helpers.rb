def sign_up
  visit '/'
  click_button 'Create new account'

  expect(current_path).to eq '/users/new'
  fill_in('username', with: "username")
  fill_in('password', with: "password")
  click_button('Create account')
end