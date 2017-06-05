feature 'When adding new peeps, can see all peeps in reverse chronological order' do
  scenario 'Peeps appear in reverse chronological order' do
    visit('/')
    fill_in 'message', with: 'Old Peep'
    click_button 'Submit'
    fill_in 'message', with: 'Middle Peep'
    click_button 'Submit'
    fill_in 'message', with: 'Newest Peep'
    click_button 'Submit'
    expect('Newest Peep').to appear_before('Old Peep')
  end
end
