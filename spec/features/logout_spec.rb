require './app/models/user'

feature "logout" do
  scenario "user sees goodbye message after logging out" do
      create_log_in
      click_button "Logout"
      expect(page).to have_content "Goodbye!"
      expect(page).not_to have_content "Welcome hulk@gmail.com!"
  end
end
