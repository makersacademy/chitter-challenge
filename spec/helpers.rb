def signup(display_name: 'Bob', username: 'bob',
           email: 'bob@example.com', password: 'password123')
  visit '/signup'
  fill_in :display_name, with: display_name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password

  click_button 'Create account'
end
