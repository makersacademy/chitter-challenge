feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    Peep.create(peep: 'Hiya!')
    visit('/peeps')
    expect(page).to have_content('Hiya!')

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('Hiya!')
  end
end