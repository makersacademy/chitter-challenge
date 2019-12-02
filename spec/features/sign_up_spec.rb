feature "sign_up" do
    scenario "a user can sign_up to chitter" do
      visit ("/sign_up")
      expect(page).to have_current_path("/sign_up")
    end
end
