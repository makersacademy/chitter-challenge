feature 'User logout' do
  scenario 'can log out' do
    user_signup
    user_login(email: 'johndoe@email.com', password: 'pass123')
    click_button 'Log out'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Welcome, JohnnyD!'
  end
end
