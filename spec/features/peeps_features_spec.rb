feature 'Displays peeps in reverse order' do
  scenario 'Displays new peep' do
    clear_database
    populate_database
    visit ('/')
    fill_in 'peeps', with: 'test3'
    click_button 'peep'
    expect(page).to have_content('test1')
    expect(page).to have_content('test2')
    expect(page).to have_content('test3')
  end
end
