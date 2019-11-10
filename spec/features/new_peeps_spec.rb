feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/peeps/new')
    fill_in('comment', with: 'Despite constant negative press covfefe')
    click_button('Submit')

    expect(page).to have_content 'Despite constant negative press covfefe'
  end
end
