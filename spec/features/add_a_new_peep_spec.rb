
feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/add_a_new_peep')
    fill_in('message', with: 'I am adding a new peep')
    click_button('Submit')

    expect(page).to have_content 'I am adding a new peep'
  end
end
