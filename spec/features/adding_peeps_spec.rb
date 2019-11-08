feature "adding a new peep" do
  scenario "a user can add a new peep" do
    visit("/createpeep")
    fill_in "peep_text", with: "This is a test peep"
    click_button("create_peep")
    visit("/")

    expect(page).to have_content "This is a test peep"
  end
end
