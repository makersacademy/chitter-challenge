feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('text', with: 'test peep')
    click_button('Submit')

    expect(page).to have_content 'test peep'
  end
end
