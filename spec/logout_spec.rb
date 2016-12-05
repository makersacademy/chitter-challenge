feature "User logs out" do
  before(:each) do
    User.create(email: "test@gmail.com", password: "test", password_confirmation: "test")
  end

  scenario "while being logged in" do
      login(email: "test@gmail.com", password: "test")
      click_button "Log out"
      expect(page).to have_content("Goodbye!")
      expect(page).not_to have_content("Welcome, test@gmail.com")
  end
end
