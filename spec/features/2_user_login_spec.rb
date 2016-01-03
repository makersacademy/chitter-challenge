feature 'User login' do
  scenario 'can log in with correct credentials' do
    user_signup
    user_login(email: 'johndoe@email.com', password: 'pass123')
    expect(page).to have_content 'Welcome, JohnnyD!'
  end
end
