feature 'Posting a peep' do
  scenario 'a user can post a peep' do
    peep = 'This is a test peep!'
    Peep.create(peep: peep)

    visit '/peeps'

    expect(page).to have_field 'peep'
    expect(page).to have_button 'Peep it'

    click_button 'Peep it'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content peep
  end
end
