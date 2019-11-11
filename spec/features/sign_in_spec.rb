feature 'loging in' do
  scenario 'a user signs in with the correct credentials' do
    visit '/login'
    fill_in(:email, with: "test@gmail.com")
    fill_in(:password, with: "password123")
    click_button("Log In")
    expect(page).to have_content("Welcome, Robert")
  end

  scenario 'a user tries to sign in with an invalid email' do
    visit '/login'
    fill_in(:email, with: "invalid@gmail.com")
    fill_in(:password, with: "invalid")
    click_button("Log In")
    expect(page).to have_content("User not found, Please sign up!")
  end

  scenario 'a user tries to sign in with the wrong password' do
    visit '/login'
    fill_in(:email, with: "test@gmail.com")
    fill_in(:password, with: "invalid")
    click_button("Log In")
    expect(page).to have_content("Email or Password incorrect")
  end

  scenario 'user signs in, log out button becomes visible' do
    visit '/login'
    fill_in(:email, with: "test@gmail.com")
    fill_in(:password, with: "password123")
    click_button("Log In")
    expect(page).to have_content("Log out")
  end
end