feature 'show created at time' do
  scenario 'show timestamp on new peep' do
    visit '/home'
    fill_in 'peep-content', with: "Test Peep"
    click_button "Peep"
    expect(page).to have_content "Seconds ago"
  end
end