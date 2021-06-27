feature 'Authentication' do
  scenario 'a user can sign in with email and password' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Test Name', username: 'testuser1')

    visit '/sessions/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    click_button('Sign in')

    expect(page).to have_content 'Welcome, Test Name (@testuser1)'
  end
end
