feature 'authentication' do
  it 'can sign in a user' do
    User.create(email: 'cat@email.com', password: 'password123', name: 'Cat', username: 'catty')
    visit('/sessions/new')
    fill_in(:email, with: 'cat@email.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, cat@email.com'
  end
end
