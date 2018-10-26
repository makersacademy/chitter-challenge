
feature 'As a user:' do
  scenario 'I can create an account' do
    create_account('jones')
    expect(page).to have_content "Logged in as John"
  end
  scenario 'I cannot have the same username or email' do
    create_account('john')
    click_button 'Logout'
    create_account('john')
    expect(page).to have_content "Username or email already taken"
  end
  scenario 'I can log out' do
    create_account('james')
    click_button 'Logout'
    expect(page).not_to have_content "Logged in as John"
  end
  scenario 'I can log in' do
    create_account('Jimmy', 'Jimmy')
    click_button 'Logout'
    fill_in('Username', with: 'Jimmy')
    fill_in('Password', with: 'password')
    click_button 'Log In'
    expect(page).to have_content "Logged in as Jimmy"
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
feature 'registering' do
  scenario 'passwords dont match' do
    visit '/'
    click_button 'Register'
    fill_in('Name', with: "John")
    fill_in('Username', with: "Jonny101")
    fill_in('Password', with: 'password')
    fill_in('Confirm_Password', with: 'notpassword')
    fill_in('Email', with: 'my@email.com')
    click_button 'Submit'
    expect(page).to have_content "Passwords don't match."
  end
  scenario 'passwords dont match' do
    visit '/'
    create_account("Jonny101")
    click_button("Logout")
    click_button 'Register'
    fill_in('Name', with: "John")
    fill_in('Username', with: "Jonny101")
    fill_in('Password', with: 'password')
    fill_in('Confirm_Password', with: 'password')
    fill_in('Email', with: 'my@email.com')
    click_button 'Submit'
    expect(page).to have_content "Username or email already taken"
  end
end
