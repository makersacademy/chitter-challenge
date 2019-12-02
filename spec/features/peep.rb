feature "Peep" do
  scenario "Adds a peep" do
    visit("/peep")
    fill_in("peep", with: "Hello")
    click_button("Peep")
    expect(page).to have_content("Hello")
  end
end
