require './app/models/user'

feature "logout" do
  scenario "user sees goodbye message after logging out" do
      user = User.create(email: "hulk@gmail.com", password: "smash")
      visit "/login"
      fill_in "email", with: "hulk@gmail.com"
      fill_in "password", with: "smash"
      click_button "Login"
      click_button "Logout"
      expect(page).to have_content "Goodbye!"
      expect(page).not_to have_content "Welcome hulk@gmail.com!"
  end
end
