feature 'User login' do
  scenario 'can log in with correct credentials' do
    user_signup
    user_login(email: 'johndoe@email.com', password: 'pass123')
    expect(page).to have_content 'Welcome, JohnnyD!'
  end

  scenario 'cannot log in with incorrect credentials' do
    user_signup
    user_login(email: 'johndoe@email.com', password: 'wrong password')
    expect(page).to have_content 'Incorrect email or password'
  end
end
