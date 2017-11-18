feature "first test" do
  scenario "Set up" do
    visit('/')
      expect(page).to have_content('Hello World')
    end
  end
