feature "Create new peep" do

  scenario "User can create a new peep and it is added to the list" do
    visit("/")
    fill_in("peep_text", with: "A new peep")
    click_button("Submit")
    expect(page).to have_content("A new peep")
  end

end
