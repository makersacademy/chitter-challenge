feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    Peep.create(peep: 'test for deleting a peep', time: Time.new(2001))
    visit('/peeps')
    expect(page).to have_content('test for deleting a peep')
    first('.peep').click_button 'Delete'
    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('test for deleting peep')
  end
end
