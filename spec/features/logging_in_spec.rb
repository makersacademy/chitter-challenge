feature "Logging in to Chitter" do
  scenario "User can log in to Chitter" do
    sign_up
    click_button("Log out")
    log_in("Kynosaur", "amazing_password")
    expect(page).to have_content("Log in successful!")
  end

  scenario "User logs in and sees their username in the welcome message" do
    sign_up
    click_button("Log out")
    log_in("Kynosaur", "amazing_password")
    expect(page).to have_content("Welcome to Chitter, Kynosaur!")
  end

  scenario "User enters correct username and wrong password, does not get logged in" do
    sign_up
    click_button("Log out")
    log_in("Kynosaur", "substandard_password")
    expect(page).to have_content("Username or password is incorrect")
  end

  scenario "User enters wrong username and sees an error message" do
    sign_up
    click_button("Log out")
    log_in("Kynosnore", "amazing_password")
    expect(page).to have_content("Username or password is incorrect")
  end
end
