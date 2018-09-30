feature 'Signup' do
  scenario 'User can navigate to a sign up page' do
    visit("/")
    click_button('Sign up!')
    expect(page).to have_content "Sign in!"
  end

  scenario 'User can sign up successfully' do
    clean_database
    signup_navigation
    happy_signup
    expect(page).to have_content("Login!")
  end

  scenario 'Email already in use cannot sign up again' do
    clean_database
    signup_navigation
    happy_signup
    signup_navigation
    enter_same_email
    expect(page).to have_content("Username or password already in use!")
  end

  scenario 'Username already in use cannot sign up again' do
    clean_database
    signup_navigation
    happy_signup
    signup_navigation
    enter_same_username
    expect(page).to have_content("Username or password already in use!")
  end

  scenario 'User attempts sign up with no username' do
    clean_database
    signup_navigation
    click_button("Sign me up!")
    expect(page).to have_content("Sign up!")
  end

  scenario 'User attempts sign up with no email' do
    clean_database
    signup_navigation
    fill_in 'username', with: "RedXIII"
    click_button("Sign me up!")
    expect(page).to have_content("Sign up!")
  end

  scenario 'User attempts sign up with no password' do
    clean_database
    signup_navigation
    fill_in 'username', with: "RedXIII"
    fill_in 'email', with: "ancientsforver@gmail.com"
    click_button("Sign me up!")
    expect(page).to have_content("Sign up!")
  end

end
