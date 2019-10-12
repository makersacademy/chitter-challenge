feature 'Adding a new peep to Chitter' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('peep', with: 'new peep')
    fill_in('username', with: 'Josh')
    click_button('Submit')

    expect(page).to have_content 'new peep'
    expect(page).to have_content 'Josh'
  end
end
