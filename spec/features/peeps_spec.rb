feature 'peeps' do
  scenario 'on peeps page, displays message to user' do
    visit('/peeps')
    expect(page).to have_content "Catch up on the latest peeps!"
  end

  scenario 'on peeps page, user can log-out' do
    visit('/peeps')
    click_link('Logout!')
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario 'on peeps page, user can create new peep' do
    visit('/peeps')
    click_link('Create new Peep!')
    expect(page).to have_content "Start peeping!"
  end

end
