feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/peeps/new')
    fill_in('msg', with: 'test message')
    click_button('Submit')

    expect(page).to have_content 'test message'
  end
end
