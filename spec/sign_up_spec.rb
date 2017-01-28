feature "sign up to Chitter" do
  scenario "it allows users to sign up using their name" do
    visit '/sign_up'
      fill_in :name, with: "James"
      expect(page).to have_content "Welcome back, James"
    end
end
