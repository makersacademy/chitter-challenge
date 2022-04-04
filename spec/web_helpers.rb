def create_user_and_log_in
  User.create(
    username: 'ChrisL', 
    email: 'chris@chris.com',
    first_name: 'Chris',
    last_name: 'Lovell',
    password: '12345'
  )
  visit('/')
  click_button("Log in")
  fill_in 'log_in_username', with: 'ChrisL'
  fill_in 'log_in_password', with: '12345'
  click_button "Log in"
end

def create_user_and_post
  user = User.create(
    username: 'ChrisL', 
    email: 'chris@chris.com',
    first_name: 'Chris',
    last_name: 'Lovell',
    password: '12345'
  )
  post = Post.create(peep: "Hello, world!", user_id: user.id)
end

def log_in
  visit('/')
  click_button("Log in")
  fill_in 'log_in_username', with: 'ChrisL'
  fill_in 'log_in_password', with: '12345'
  click_button "Log in"
end
