feature 'authentication' do
  it 'a user can sign in' do
    # Create a test user
    user = User.create(name: 'Ngai Sui', email: 'jess@chitter.com', username: 'jess', password: 'born2chit')
    # Then sign in as them
    visit '/users/login'
    fill_in(:username, with: 'jess')
    fill_in(:password, with: 'born2chit')
    click_button('LOGIN')

    expect(page).to have_content 'Welcome back, jess!'
  end
end
