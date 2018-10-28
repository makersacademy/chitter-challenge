feature 'authentication' do
  it 'a user can sign in' do
    User.create(name: 'Tester', username: 'ChitterTester', email: 'test@example.com', password: 'password123')

    visit '/sessions/new'
    fill_in(:username, with: 'ChitterTester')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content '@ChitterTester'
  end
end
