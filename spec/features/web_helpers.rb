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

def sign_up

end
