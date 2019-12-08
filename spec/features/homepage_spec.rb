feature "visit homepage" do
  scenario "it has a welcome message" do
    visit '/chitter'
    expect(page).to have_content "Chitty Chitty Bang Bang!"
  end

  scenario "it displays all the peeps posted" do

    visit '/chitter'

    expect(page).to have_content "I am obsessed with this new pizza joint!"
  end
end
