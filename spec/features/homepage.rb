feature "Homepage" do
  scenario "Displays Homepage" do
    visit("/")
    expect(page).to have_content("Homepage")
  end
end
