feature 'signout' do
  scenario 'user can log out' do
    User.create(name: 'Erin', username: 'ES94', email: 'test@test.com', password: 'password')

    visit('/sessions/signin')
    fill_in 'username', with: 'ES94'
    fill_in 'password', with: 'password'
    click_button 'log in'

    click_button 'log out'
    
    expect(page).to_not have_content "Welcome to Chitter Erin"
    expect(page).to have_content "You have logged out"
  end
end
