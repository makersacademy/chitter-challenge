feature 'Adding a new cheep' do
  scenario 'A user can add a cheep' do
    visit('/create_cheep')
    fill_in('author', with: 'TEST_USER')
    fill_in('message', with: 'TEST CHEEP')
    click_button('Submit')

    expect(page).to have_content 'TEST CHEEP'
  end
end