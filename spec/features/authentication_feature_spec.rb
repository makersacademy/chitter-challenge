feature 'authentication' do
  it 'a user can sign in' do
    User.create(
      name: 'Chris Gilbert',
      username: 'PeeperChris',
      email: 'test@example.com',
      password: 'password123')

    visit '/'
    click_button 'Log In'
    expect(current_path).to eq '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')

    expect(page).to have_content 'Welcome, PeeperChris'
  end
end
