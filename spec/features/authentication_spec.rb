feature 'authentication' do
  it 'a user can sign in' do
    # Create a test user
    User.create(email: 'test@example.com', password: 'password123', name: 'testname', username: 'username')

    # Then sign in as them
    visit '/sessions/new'
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'test_password')
    fill_in('name', with: 'testname')
    fill_in('username', with: 'test_username')
    click_button('Sign in')
  end
end