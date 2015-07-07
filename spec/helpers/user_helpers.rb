def sign_in(user)
  visit '/users/login'
  fill_in :username, with: user.username
  fill_in :password, with: user.password
  click_button 'Sign in'
end

def sign_up(email:    'alice@test.com',
            name:     'Alice Test',
            username: 'alicetest',
            password: 'secret1234',
            password_confirmation: 'secret1234')
  visit '/users/new'
  fill_in :email,     with: email
  fill_in :name,      with: name
  fill_in :username,  with: username
  fill_in :password,  with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def create_user
  User.create(email:    'alice@test.com',
              name:     'Alice Test',
              username: 'alicetest',
              password: 'secret1234',
              password_confirmation: 'secret1234')
end