feature 'Submitting a Peep' do
  scenario 'A user can post a peep' do
    visit '/'
    fill_in :peep, with: 'Test peep'
    click_button 'Submit'
  end
end
