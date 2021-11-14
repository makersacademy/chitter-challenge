feature 'creating a new peep' do
  scenario 'user can post a new peep' do
    visit '/peeps'
    fill_in('Description', with: 'Really Long Text...')
    click_button('Peep!')

    expect(page).to have_content('Really Long Text...')
  end
end
