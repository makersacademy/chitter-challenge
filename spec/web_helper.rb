def sign_up(email:    'bot@bot.com.com',
            username: 'chitbot',
            name:     'Mr Chit Bot')
            # password: '123456',
            # password_confirmation: '123456')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'chitbot'
  fill_in :name,     with: 'Mr Chit Bot'
  fill_in :email,    with: 'bot@bot.com'
  # fill_in :password, with: 'password'
  # fill_in :password_confirmation, with: 'password'

  click_button 'Sign up'
end
