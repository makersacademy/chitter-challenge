def signup(display_name: 'Bob', username: 'bob',
           email: 'bob@example.com', password: 'password123')
  visit '/signup'
  fill_in :display_name, with: display_name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password

  click_button 'Create account'
end

def login(username: 'bob', password: 'password123')
  visit '/login'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Sign in'
end

def peep(message: 'Tiramisu is delicious.')
  visit '/'
  fill_in :message, with: message
  click_button 'Peep'
end
