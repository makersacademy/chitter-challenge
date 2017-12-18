feature 'index view loads upon request' do
  scenario 'rackingup brings up the index page' do
    visit('/peep_home')
    expect(page).to have_content('Chitter')
  end
end
