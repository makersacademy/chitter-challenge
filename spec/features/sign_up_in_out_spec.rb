feature "Users have logins" do
  scenario "User can sign up for Chitter" do
    sign_up
    expect(page).to have_content "Sign up successful"
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario "Username must be unique" do
    sign_up
    sign_up
    expect(page).to have_content "Username has already been taken"
    expect(page).to_not have_content "Sign up successful"
  end

  scenario "Email must be unique" do
    sign_up
    sign_up
    expect(page).to have_content "Email has already been taken"
    expect(page).to_not have_content "Sign up successful"
  end

  scenario "Registered users can log in" do
    log_in
    expect(page).to have_content "Welcome back"
    expect(page).to_not have_content "Error"
  end

  scenario "Unregistered users can't log in" do
    visit("/log_in")
    fill_in "username", with: "Username2"
    fill_in "password", with: "password2"
    click_button "Log in"
    expect(page).to have_content "Error: user not found"
    expect(page).to_not have_content "Welcome back"
  end

  scenario "User can log out (if logged in)" do
    log_in
    visit("/")
    click_button "Log Out"
    expect(page).to have_content "User Username logged out"
    expect(page).to_not have_content "Error"
  end
end
