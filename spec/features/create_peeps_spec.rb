feature 'Adding a new peep to Chitter' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('peep', with: 'fourth peep')
    click_button('Submit')

    expect(page).to have_content 'fourth peep'
  end
end
