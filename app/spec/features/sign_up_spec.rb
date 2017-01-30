feature 'Sign up' do
  scenario 'User can sign up to Chitter' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter Gus'
  end

  scenario 'When signing up username must be unique' do
    sign_up(username: 'test', email: 'random123@googlemail.com')
    click_button 'Logout'
    sign_up(username: 'test', email: 'test@test.com')
    expect(page).to have_content 'Username is already taken'
  end

  
end
