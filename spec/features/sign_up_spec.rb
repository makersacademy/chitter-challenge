feature 'Sign up' do
  scenario 'User can sign up to Chitter' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter Mannie'
  end

  scenario 'When signing up username must be unique' do
    sign_up(username: 'test', email: 'random123@googlemail.com')
    click_button 'Logout'
    sign_up(username: 'test', email: 'mannie@googlemail.com')
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'When signing up email must be unique' do
    sign_up(username: 'test23', email: 'random123@googlemail.com')
    click_button 'Logout'
    sign_up(username: 'test99', email: 'random123@googlemail.com')
    expect(page).to have_content 'Email is already taken'
  end
end
