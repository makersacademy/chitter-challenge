feature "Adding a peep " do
  scenario "user enters a peep to the form and submits it to the list" do
    visit ("/peeps")
    fill_in :peep_text, with: "Hello world"
    fill_in :name, with: "Louis"
    fill_in :handle, with: "louism"
    click_button "Peep"
    expect(page).to have_content "Hello world"
  end

  scenario "User enters no peep to form and hits submit" do
    visit '/peeps'
    click_button "Peep"
    expect(page).to have_content "No peep text given"
  end
end
