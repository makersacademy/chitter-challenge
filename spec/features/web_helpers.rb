def sign_in_to_chitter
  User.create(
    name: "Test User",
    email: 'testuser@email.com',
    username: 'Test_username',
    password: 'password'
  )

  visit '/sessions/new' # signing in page

  fill_in 'username', with: 'Test_username'
  fill_in 'password', with: 'password'

  click_button 'Sign In'
end

def create_users
  User.create(
    name: "Test User 2",
    email: 'testuser2@email.com',
    username: 'Test_username2',
    password: 'password'
  )
  User.create(
    name: "Test User 3",
    email: 'testuser3@email.com',
    username: 'Test_username3',
    password: 'password'
  )
end
