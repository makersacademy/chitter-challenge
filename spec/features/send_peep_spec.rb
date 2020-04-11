feature "User can send a peep" do
  scenario "User clicks a button to take them to the 'Compose a peep' page" do
    visit '/'
    click_button "Post a new Peep"
    expect(page).to have_content "Compose a Peep!"
  end

  scenario "User can type their peep, submit and view it" do
    visit '/compose_peep'
    fill_in :peep_text, with: "Sunny sunny day!"
    click_button "Submit Peep"

    expect(page).to have_content "Sunny sunny day!"
  end
end
