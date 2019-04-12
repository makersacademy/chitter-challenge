feature 'Add a peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('content', with: 'Test Peep')
    fill_in('username', with: 'Deanna')
    click_button('Create')

    expect(page).to have_content 'Test Peep'
    expect(page).to have_content 'Deanna'
  end
end
