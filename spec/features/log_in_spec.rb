feature "Log in" do
  scenario "User can log in to an existing account" do
    sign_up_generic_user
    visit("/")
    click_link("Log In")
    fill_in "username", with: "username"
    fill_in "password", with: "password"
    click_button("Log In")
    expect(page).to have_content "Welcome back, @username."
  end
end
