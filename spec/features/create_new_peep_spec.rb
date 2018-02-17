feature "Create new peep" do

  scenario "User can add a new peep and it is added to the list" do
    visit("/")
    click_button("New peep")
    fill_in("peep_text", with: "A new peep")
    click_button("Submit")
    expect(page).to have_content("A new peep")
  end

end
