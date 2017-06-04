feature "Logging in to Chitter" do
  scenario "User can log in to Chitter" do
    sign_up
    log_out_and_begin_log_in
    fill_in("password", with: "amazing_password")
    click_button("Log in")
    expect(page).to have_content("Log in successful!")
  end

  scenario "User logs in and sees their username in the welcome message" do
    sign_up
    log_out_and_begin_log_in
    fill_in("password", with: "amazing_password")
    click_button("Log in")
    click_button("Get Chittering!")
    expect(page).to have_content("Welcome to Chitter, Kynosaur!")
  end

  scenario "User enters correct username and wrong password, does not get logged in" do
    sign_up
    log_out_and_begin_log_in
    fill_in("password", with: "substandard_password")
    click_button("Log in")
    expect(page).to have_content("Username or password is incorrect")
  end

  scenario "User enters wrong username and sees an error message" do
    sign_up
    log_out_and_begin_log_in
    fill_in("username", with: "Kynosnore")
    fill_in("password", with: "amazing_password")
    click_button("Log in")
    expect(page).to have_content("Username or password is incorrect")
  end
end
