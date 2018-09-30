feature 'Login' do
  scenario 'User can log in successfully' do
    clean_database
    signup_navigation
    happy_signup
    happy_login
    expect(page).to have_button('Post!')
  end

  scenario 'Invalid user cannot log in' do
    clean_database
    happy_login
    expect(page).to have_content("Sorry, unknown username or password!")
  end

  scenario 'User cannot sign in without no username' do
    clean_database
    visit("/")
    click_button('Login!')
    expect(page).to have_content("Sorry, unknown username or password!")
  end

  scenario 'User cannot sign in without no password' do
    clean_database
    visit("/")
    fill_in 'username', with: "Cid"
    click_button('Login!')
    expect(page).to have_content("Sorry, unknown username or password!")
  end

  scenario 'User cannot sign in with invalid data' do
    clean_database
    visit("/")
    fill_in 'username', with: "Cid"
    fill_in 'password', with: "ilikeflying"
    click_button('Login!')
    expect(page).to have_content("Sorry, unknown username or password!")
  end
end
