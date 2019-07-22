feature "testing" do
    scenario "test" do
      visit("/home")
      expect(page).to have_content('Buffy')
    end
  end