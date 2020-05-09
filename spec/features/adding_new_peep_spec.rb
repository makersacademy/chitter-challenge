feature 'Adding new peep' do
  scenario 'user can add new peep' do
    visit '/peeps/new'
    fill_in('author', with: 'Zsofi')
    fill_in('content', with: 'Test')
    click_on('Submit')

    expect(page).to have_content 'Test'
  end
end
