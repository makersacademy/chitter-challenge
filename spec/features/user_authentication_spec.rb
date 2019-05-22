feature 'User sign in' do
  scenario 'After a user has signed up, they have an option to log in' do
    go_to_sign_up
    sign_up
    click_button 'See peeps'
    expect(page).to have_button "Log In"
    expect(page).to have_content "You are not currently logged in"
  end

  scenario 'After a user clicks Log in they see a log in form' do
    go_to_sign_up
    sign_up
    go_to_login
    expect(page).to have_css("input", :count => 3)
  end

  scenario 'After a user clicks Log in they see a log in form' do
    go_to_sign_up
    sign_up
    go_to_login
    expect(page).to have_content "Welcome back! Log in below"
    expect(page).to have_css("input", :count => 3)
  end

  scenario 'User can log in' do
    sign_up_and_login
    expect(page).to have_content "You are logged in as sami"
  end

  scenario 'User gets an error for incorrect log in' do
    go_to_sign_up
    sign_up
    go_to_login
    login("wrongpassword")
    expect(page).to have_content "Welcome back! Log in below" # Update once using flash
  end

  scenario 'User can log out' do
    sign_up_and_login
    click_button 'Log Out'
    expect(page).to have_content "You are not currently logged in"
  end
end
