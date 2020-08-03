def register_user
  visit('/users/new')
  fill_in('username', with: 'FirstAuthor')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Submit')
end
