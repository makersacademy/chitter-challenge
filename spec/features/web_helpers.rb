def sign_in
  visit '/users/new'
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  fill_in('name', with: 'Jane Doe')
  fill_in('username', with: '@username')
  click_button('Submit')
end

def peep
  fill_in('text', with: 'This is a test peep')
  click_button('Submit')
end