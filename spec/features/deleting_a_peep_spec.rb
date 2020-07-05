feature "Deleting a peep" do
  scenario "A user can delete a peep" do
    Peep.create(text: "Hi", name: "Stacy")
    visit("/peeps")
    expect(page).to have_link("Stacy")
    

    first(".peep").click_button "Delete"

    expect(current_path).to eq "/peeps"
    expect(page).not_to have_link("Stacy")
  end
end
