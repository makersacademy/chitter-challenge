feature 'authentication' do
  it 'a user can sign in' do
    User.create(username: 'mrtest', email: 'test@example.com', password: 'password123')
    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, mrtest'
  end
end
