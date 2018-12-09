feature 'Testing sign in' do
  scenario 'Login page returns Please enter your username and password' do
    visit('/')
    expect(page).to have_content("Please enter your username and password")
  end
  scenario 'Pressing on Register takes user to register page' do
    visit('/')
    click_button("Register")
    expect(page).to have_content("Please enter a unique username and password")
  end
  scenario 'Entering a non-unique username returns to register page' do
    visit('/')
    click_button("Register")
    fill_in('username', with: "test")
    fill_in('password', with: "password")
    expect(page).to have_content("Please enter a unique username and password")
  end
  scenario 'Entering a unique username takes user to peeps page' do
    visit('/')
    click_button("Register")
    fill_in('username', with: "unique")
    fill_in('password', with: "password")
    click_button("Submit")
    expect(page).to have_content("Peep feed")
  end
  scenario 'Successful login takes user to peeps page' do
    visit('/')
    fill_in('username', with: "test")
    fill_in('password', with: "password")
    click_button("Login")
    expect(page).to have_content("Peep feed")
  end
  scenario 'Sign out returns to loginpage' do
    visit('/')
    fill_in('username', with: "test")
    fill_in('password', with: "password")
    click_button("Login")
    click_button("Sign out")
    expect(page).to have_content("Please enter your username and password")
  end
  scenario 'Sign out from add peep returns to login page' do
    visit('/')
    click_button("Register")
    fill_in('username', with: "new")
    fill_in('password', with: "password")
    click_button('Submit')
    click_button('Add peep')
    click_button('Sign out')
    expect(page).to have_content("Please enter your username and password")
  end


end
