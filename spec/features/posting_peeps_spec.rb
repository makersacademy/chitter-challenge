feature "posting a peep" do
  scenario "it allows the user to post a peep" do
    visit '/chitter'
    fill_in 'peep', with: 'First peep'
    click_button 'Peep!'
    expect(page).to have_content("First peep")
  end
end
