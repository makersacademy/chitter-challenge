feature 'Authentication' do
  scenario 'user can log in with the right email and password' do
    User.create(
      first_name: 'Happy', last_name: 'Auth', username: 'happyauth', email: 'happy@auth.com', password: '12345')
    visit('/')

    click_button 'Log in'

    fill_in :email, with: 'happy@auth.com'
    fill_in :password, with: '12345'

    click_button('Log in')

    expect(page).to have_content 'You are successfully logged in as happyauth'

  end
end
