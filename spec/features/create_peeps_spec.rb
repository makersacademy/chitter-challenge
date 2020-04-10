feature 'create a new peep' do
  scenario 'a user can create a new peep' do
    visit '/users/new'
    fill_in 'name', with: 'Phil'
    fill_in 'username', with: 'Squirrel'
    fill_in 'email', with: 'here@there.com'
    fill_in 'password', with: '1234'
    click_button 'Submit'
    click_button 'New peep'
    fill_in 'text', with: 'This is a brand new peep - wayhay!!!'
    click_button 'Submit'
    expect(page).to have_content 'This is a brand new peep - wahay!!!'
  end
end
