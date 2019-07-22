feature "sign in" do
    scenario "user signs in" do
      visit '/'
      fill_in 'name', with: 'name'
      fill_in 'email', with: "notreal@yahoo.com"
      fill_in 'username', with: "@tester"
      fill_in 'password', with: 'code'
      click_button "Submit"
      expect(page).to have_content("Welcome @tester")
    end
  end