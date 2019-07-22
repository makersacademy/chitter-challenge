feature "add new peep" do
    it "Adds a new peep" do
      visit "/home"
      click_button "add"
      fill_in "peep", with: "Hello"
      click_button "Submit"
      expect(page).to have_content "Hello"
    end
  end