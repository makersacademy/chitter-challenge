feature "Add Peep" do
  scenario "it adds a single peep to /peeps page" do
    visit('/')
    click_link("Add Peep")
    fill_in("peep_content", with: "my first peep")
    click_button("Peep")
    expect(page).to have_content("my first peep")
  end
end
