feature 'Adding Peeps' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('peep', with: 'this is a new peep')
    click_button('Submit')

    expect(page).to have_content 'this is a new peep'
  end
end
