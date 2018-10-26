feature 'Adding a new peep' do
  scenario 'A user can add a new peep to peep manager' do
    visit('/peeps')
    fill_in('message', with: 'test message')
    fill_in('user_name', with: 'test_user')
    click_button('Submit')

    expect(page).to have_content 'test message'
  end
end
