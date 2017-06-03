feature "Logging in to Chitter" do
  scenario "User logs in and sees their username in the welcome message" do
    visit("/")
    click_button("Log in")
    fill_in("username", with: "Kynosaur")
    fill_in("password", with: "amazing_password")
    click_button("Log in")
    expect(page).to have_content("Welcome to Chitter, Kynosaur!")
  end
end
