feature 'Peep Entry' do
  scenario 'user has option to enter a peep' do
    visit('/add_peep')
    expect(page).to have_field 'peep_content'
    expect(page).to have_button 'Submit'
  end
end
