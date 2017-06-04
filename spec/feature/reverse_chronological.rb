feature 'When adding new peeps, can see all peeps in reverse chronological order' do
  scenario 'Peeps appear in reverse chronological order' do
    visit('/')
    fill_in 'peep' with: 'Old Peep'
    click_button 'Submit'
    fill_in 'peep' with: 'Middle Peep'
    click_button 'Submit'
    fill_in 'peep' with: 'Newest Peep'
    click_button
    expect('Newest Peep').to appear_before('Old Peep')
  end
end
