feature "Updating a peep" do
  scenario "A user can update a peep" do
    peep = Peep.create(text: "Hello", name: "Stacey")
    visit("/peeps")
    expect(page).to have_link("Stacey")

    first(".peep").click_button "Edit"
    expect(current_path).to eq "/peeps/#{peep.id}/edit"

    fill_in("text", with: "Hello :)")
    fill_in("name", with: "Stacy")
    click_button("Submit")

    expect(current_path).to eq "/peeps"
    expect(page).not_to have_link("Stacey")
    expect(page).to have_link("Stacy")
  end
end 
