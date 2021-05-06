def sign_in
  user = User.create(email: 'test@example.com', password: 'password123', name: 'Chrissy', username: 'chrisc')
  visit '/peeps'
  click_button 'Sign in'
  fill_in(:username, with: 'chrisc')
  fill_in(:password, with: 'password123')
  click_button 'Sign in'
end
