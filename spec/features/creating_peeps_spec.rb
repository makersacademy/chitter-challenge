feature 'Adding a new peep' do
  scenario 'A user can add a peep to peep_manager' do
    visit ('/peeps/new')
    fill_in('peeps', with: 'my first peep')
    click_button('Peep')

    expect(page).to have_content('my first peep')
  end
end