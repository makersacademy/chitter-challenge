feature 'post peep' do
  scenario 'user posts a peep' do
    visit '/'
    fill_in 'peep_compose_content', with: "Test Peep"
    click_button "Peep"
    expect(page).to have_content("Test Peep")
    expect(page).to have_content("Chitter")
  end
end