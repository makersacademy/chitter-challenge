def siggning_in
  User.create(email: 'test@example.com', password: 'password123', name: 'user321', username: 'username123')
  visit '/sessions/new'
  fill_in(:username, with: 'username123')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end

def siggning_in_with_wrong_username
  User.create(email: 'test@example.com', password: 'password123', name: 'user321', username: 'username123')
  visit '/sessions/new'
  fill_in(:username, with: 'username098')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end

def siggning_in_with_wrong_password
  User.create(email: 'test@example.com', password: 'password123', name: 'user321', username: 'username123')
  visit '/sessions/new'
  fill_in(:username, with: 'username123')
  fill_in(:password, with: 'password098')
  click_button('Sign in')
end
