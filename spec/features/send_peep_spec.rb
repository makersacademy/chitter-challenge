feature "User can send a peep" do
  scenario "User clicks a button to take them to the 'Compose a peep' page" do
    visit '/'
    click_button "Post a new Peep"
    expect(page).to have_content "Compose a Peep!"
  end
end
