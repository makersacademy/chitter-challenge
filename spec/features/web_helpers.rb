def sign_in
  visit '/users/new'
  fill_in('name', with: 'Test Test')
  fill_in('username', with: 'Test')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Create account')
end
