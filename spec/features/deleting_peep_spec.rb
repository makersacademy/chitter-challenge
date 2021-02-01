feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    Peep.create(username: 'tiny_tim', peep: 'If carlsberg did web apps')
    visit('/peeps')
    expect(page).to have_content('tiny_tim')
    expect(page).to have_content('If carlsberg did web apps')

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('tiny_tim')
    expect(page).not_to have_content('If carlsberg did web apps')
  end
end
