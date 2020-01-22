feature 'viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page). to have_content "Welcome to Chitter"
end
    scenario 'viewing the posted peep' do
      visit('/')
      fill_in :message, with: "peep"
      click_button "Submit"
      expect('/peeps').to have_content "peep"
  end
end
