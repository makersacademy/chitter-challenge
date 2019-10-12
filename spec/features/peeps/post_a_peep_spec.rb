feature 'post peep' do
  scenario 'user posts a peep' do
    visit '/'
    fill_in 'peep', with: "Test Peep"
    click_button "Post Peep"
    expect(page).to have_content("Test Peep")
    expect(page).to have_content("Chitter")
  end
end