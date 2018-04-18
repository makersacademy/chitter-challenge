feature "Adding a peep " do
  scenario "user enters a peep to the form and submits it to the list" do
    sign_up
    fill_in :peep_text, with: "Hello world"
    click_button "Peep"
    expect(page).to have_content "Hello world"
  end

  scenario "User enters no peep to form and hits submit" do
    sign_up
    click_button "Peep"
    expect(page).to have_content "No peep text given"
  end

end
