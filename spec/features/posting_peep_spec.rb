
feature 'Posting Peeps' do

  scenario 'User can post a peep' do
    visit('/peeps/new')
    fill_in :peep, with: 'Test Peep'
    click_button 'PEEP!'
    expect(page).to have_content('Test Peep')
  end

end
