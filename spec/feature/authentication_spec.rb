feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Bob Marley', username: 'bmarley')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, Bob Marley!'
  end
end