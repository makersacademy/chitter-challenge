feature 'Updating a peep' do
  scenario 'A user can update a peep' do
    bookmark = Peep.create(peep: 'Salut!')
    visit('/peeps')
    expect(page).to have_content('Salut!')

    first('.peep').click_button 'Edit'
    expect(current_path).to eq "/peeps/#{peep.id}/edit"

    fill_in('peep', with: "Yoyo")
    click_button('Submit')

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('Salut!')
    expect(page).to have_content('Yoyo')
  end
end