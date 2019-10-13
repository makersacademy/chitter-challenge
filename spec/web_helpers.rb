def sign_up
  visit '/signup'
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  fill_in('name', with: 'John Doe')
  fill_in('username', with: 'johny')
  click_button('Submit')
end