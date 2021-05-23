feature 'authentication' do
  scenario 'User can login with username and password' do
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    expect(page).to have_content 'Welcome, start peeping now!'
  end

  scenario 'a user can sign out' do
    # Create the user
    User.create(email: 'test@example.com', password: 'password123')

    # Sign in as that user
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    # Sign out
    click_button('Log out')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end

  scenario 'User sees an error message if they logged in with the wrong username' do
    User.create(name: "Jo Shmo", username: "Shmo89", email: "shmo@example.com", password: "password123")

    visit '/'
    click_button 'Log in'
    fill_in(:username, with: 'Shmo89')
    fill_in(:password, with: 'password123')
    click_button 'Log in'

    expect(page).not_to have_content 'Welcome shmo@example.com, start peeping now!'
    expect(page.status_code).to eq 200
    expect(page).not_to have_content "Incorrect username or password. Please try again."
  end

  scenario 'User sees an error message if they logged in with the wrong password' do
    User.create(name: "Jo Shmo", username: "Shmo89", email: "shmo@example.com", password: "password123")

    visit '/'
    click_button 'Log in'
    fill_in(:username, with: 'Shmo89')
    fill_in(:password, with: 'password123')
    click_button 'Log in'

    expect(page).not_to have_content 'Welcome shmo@example.com, start peeping now!'
    expect(page).to have_content "Incorrect username or password. Please try again."
  end

end