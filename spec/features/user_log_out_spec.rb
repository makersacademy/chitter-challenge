feature 'User Log In' do
  scenario 'a user can log out' do
    User.create(name: 'testname', username: 'testusername', email: 'test@email.com', password: 'testpassword')

    visit '/sessions/new'
    fill_in(:username, with: 'testusername')
    fill_in(:password, with: 'testpassword')
    click_button('Sign In')

    visit '/'
    click_button 'Log Out'

    expect(page).to_not have_content 'Welcome to Chitter testusername'
    expect(page).to have_content 'You have logged out'
  end

end