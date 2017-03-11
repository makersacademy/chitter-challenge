feature "Writing a new peep" do
  scenario "User can write a new peep and view it on the peeps page" do
    visit "/peeps"
    click_button "Compose New Peep"
    fill_in :message, with: ("It's sunny today :)")
    click_button "Peep"
    expect(page).to have_content ("It's sunny today :)")
  end
end
