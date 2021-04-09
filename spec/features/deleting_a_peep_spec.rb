feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    Peep.create(peep: 'Salut!')
    visit('/peeps')
    expect(page).to have_content('Salut!')

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('Salut!')
  end
end