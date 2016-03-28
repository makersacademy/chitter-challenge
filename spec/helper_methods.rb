def sign_in
  visit '/user/new'
  fill_in :name, with: 'John'
  fill_in :username, with: 'JohnDude'
  fill_in :email, with: 'john@john.com'
  fill_in :password, with: 'J0hn123!'
  click_button 'Start Peeping!'
end

def create_user
  User.create(name: 'John',
              username: 'JohnDude',
              email: 'john@john.com',
              password: 'J0hn123!')
end

def sign_up
  visit '/session/new'
  fill_in :username, with: 'JohnDude'
  fill_in :password, with: 'J0hn123!'
  click_button 'Sign in!'
end
