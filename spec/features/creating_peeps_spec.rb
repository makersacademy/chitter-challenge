feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'Here is my first peep')
    fill_in('name', with: 'Jo')
    click_button('Submit')

    expect(page).to have_content 'Here is my first peep'
    expect(page).to have_content 'Jo'
  end
end