feature 'logging out' do
  scenario 'User can log out from Chitter' do
    User.create(email: 'test@example.com', password: 'password123', name: 'Chrissy', username: 'chrisc')

    visit '/peeps'
    click_button 'Sign in'
    fill_in(:username, with: 'chrisc')
    fill_in(:password, with: 'password123')
    click_button 'Sign in'

    click_button 'Sign out'

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out'

  end
end
