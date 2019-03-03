feature 'creating a peep' do
    scenario 'a user can create post a peep to chitter' do
    visit('/peeps/new')
    fill_in('peep', with: 'Test peep')
    click_button('peep')
    expect(page).to have_content('Test peep')
  end
end
