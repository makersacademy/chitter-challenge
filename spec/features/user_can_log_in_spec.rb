feature 'User login' do
  scenario 'User can login with username and password' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Chrissy', username: 'chrisc')

    visit '/peeps'
    fill_in(:username, with: 'chrisc')
    fill_in(:password, with: 'password123')
    click_button 'Sign in'
    expect(page).to have_content 'Welcome Chrissy, start peeping now!'
  end
end
