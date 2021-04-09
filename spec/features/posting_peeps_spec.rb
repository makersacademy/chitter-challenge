feature 'Adding a new peep' do
  scenario 'A user can add a peep to Peep Manager' do
    visit('/peeps/new')
    fill_in('peep', with: 'Kikoo!')
    click_button('Submit')

    expect(page).to have_content 'Kikoo!'
  end
end
