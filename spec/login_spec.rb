

feature "login to Chitter" do
  scenario "it allows users to login using their name" do
    visit '/login'
      fill_in :name, with: "Rob"
      expect(page).to have_content "Welcome back, Rob"
    end
end
