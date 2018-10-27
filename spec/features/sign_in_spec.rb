
feature 'As a user:' do
  scenario 'I can create an account' do
    create_account('jones')
    expect(page).to have_content "Welcome, John"
  end
  scenario 'I can log out' do
    create_account('james')
    click_button 'Logout'
    expect(page).not_to have_content "Welcome, John"
  end
  scenario 'I can log in' do
    create_account('Jimmy', 'Jimmy')
    click_button 'Logout'
    fill_in('Username', with: 'Jimmy')
    fill_in('Password', with: 'password')
    click_button 'Log In'
    expect(page).to have_content "Welcome, Jimmy"
  end
end
feature "Logging in:" do
  scenario 'Wrong password' do
    create_account('Jimmy')
    click_button 'Logout'
    fill_in('Username', with: 'Jimmy')
    fill_in('Password', with: 'incorrect')
    click_button 'Log In'
    expect(page).to have_content "Invalid credentials"
  end
  scenario 'unknown username' do
    create_account('Jimmy')
    click_button 'Logout'
    fill_in('Username', with: 'John')
    fill_in('Password', with: 'password')
    click_button 'Log In'
    expect(page).to have_content "Invalid credentials"
  end
end
