
def login
  User.create(name: 'John Smith', username: 'jsmith', email: 'john@smith.com', password: 'password')
  visit('/')

  click_button 'Log In'

  fill_in "username", with: "jsmith"
  fill_in "password", with: "password"

  click_button 'Log In'
end