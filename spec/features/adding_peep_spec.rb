feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter Manager' do
    visit('/peeps/new')
    fill_in('peep text', with: 'Test Peep')
    click_button('Submit')

    expect(page).to have_content 'Test Peep'
  end
end
