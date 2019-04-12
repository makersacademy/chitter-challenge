feature 'Add a peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('content', with: 'Test Peep')
    click_button('Create')

    expect(page).to have_content 'Test Peep'
  end
end
