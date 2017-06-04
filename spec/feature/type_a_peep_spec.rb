feature 'Peep Entry' do
  scenario 'user has option to enter a peep' do
    visit('/add_peep')
    expect(page).to have_field 'content'
    expect(page).to have_button 'Submit'
  end
end
