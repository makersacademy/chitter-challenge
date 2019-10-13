feature 'post peep' do
  scenario 'unauthenticated users cant post' do
    visit '/home'

    expect(page).to have_content("Chitter")
    expect(page).to_not have_field('peep-content')
  end

  scenario 'user posts a peep' do
    log_in_post_peep

    expect(page).to have_content("Test Peep")
    expect(page).to have_content("Chitter")
  end
end