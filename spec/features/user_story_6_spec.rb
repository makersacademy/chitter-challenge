feature "6. So that I can avoid others posting messages on Chitter as me" do
  scenario "I want to log out of Chitter" do
    user = User.create(email: "test@example.com", password: "password123", name: "User 1", user_name: "Usr1")

    visit '/'
    click_button("Log in")
    fill_in("email", with: "test@example.com")
    fill_in("password", with: "password123")
    click_button("Submit")
    click_button("Log out")
    expect(page).not_to have_content("User 1")
    expect(page).to have_content("You have logged out")
  end
end
