feature "Log in" do
  scenario "User can log in to an existing account" do
    visit("/")
    click_link("Log In")
    fill_in "username", with: "username"
    fill_in "password", with: "password"
    expect(page).to have_content "Welcome back, @username."
  end
end
