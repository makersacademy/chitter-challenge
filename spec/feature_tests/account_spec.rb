feature "account security" do

  scenario "it should not let me login with out a registered username" do
    register
    fill_in"username", with:"not potatoman"
    fill_in"password", with:"potato"
    click_on"login"
    expect(page).to have_content "Incorrect username or password"
  end

  scenario "should not let me log into a username if my password is incorrect" do
    register
    fill_in"username", with:"potatoman"
    fill_in"password", with:"not_potato"
    click_on"login"
    expect(page).to have_content "Incorrect username or password"
  end

  scenario "when i logout i want to return to the login/signup page" do
    sign_in
    click_on"logout"
    expect(page).to have_content "Welcome to Chitter"
  end
  

end