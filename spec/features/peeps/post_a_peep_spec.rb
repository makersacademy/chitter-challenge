feature 'post peep' do
  scenario 'unauthenticated users cant post' do
    visit '/home'

    expect(page).to have_content("Chitter")
    expect(page).to_not have_field('peep-content')
  end

  scenario 'user posts a peep' do
    new_user
    log_in('password')
    visit '/home'
    fill_in 'peep-content', with: "Test Peep"
    click_button "Peep"
    
    expect(page).to have_content("Test Peep")
    expect(page).to have_content("Chitter")
  end
end