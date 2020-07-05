feature "Adding a new peep" do
  scenario "A user can add a peep" do
    visit("/peeps/new")
    fill_in("text", with: "What a lovely day")
    fill_in("name", with: "Iryna")
    click_button("Submit")

    expect(page).to have_link("Iryna")
  end
end
