feature 'post peep' do
  scenario 'user posts a peep' do
    visit '/home'
    fill_in 'peep-content', with: "Test Peep"
    click_button "Peep"
    expect(page).to have_content("Test Peep")
    expect(page).to have_content("Chitter")
  end
end