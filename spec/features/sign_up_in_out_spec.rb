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
end
