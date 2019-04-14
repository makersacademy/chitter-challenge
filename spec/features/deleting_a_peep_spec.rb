feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    sign_in
    Peep.create(content: 'This is a peep')
    visit('/peeps')
    expect(page).to have_content('This is a peep')

    click_button 'Delete'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('This is a peep')
  end
end
