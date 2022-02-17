feature "creating a peep" do
  scenario "the user inputs a peep and sees a confirmation that its saved" do
    visit '/peeps'
    click_button "New Peep"
    expect(page).to have_current_path '/peeps/new'
    fill_in :peep, with: 'First peep'
    click_button "submit"
    expect(page).to have_content("First peep")
    end
end