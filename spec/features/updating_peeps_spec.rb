feature 'Updating a peep' do
  scenario 'A user can update a peep' do
    peep = Peep.create(peep: "Hi!")
    visit('/peeps')
    expect(page).to have_content("Hi!")

    first('.peep').click_button 'Edit'
    expect(current_path).to eq "/peeps/#{peep.id}/edit"

    fill_in('peep', with: "Whaat")
    click_button('Submit')

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content("Hi!")
    expect(page).to have_content("Whaat")
  end
end