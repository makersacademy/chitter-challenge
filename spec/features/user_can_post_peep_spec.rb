feature 'post peep' do
  scenario 'user can post a peep if logged in' do
    login
    fill_in 'message', with: 'This is a new peep'
    click_button 'Peep'
    expect(page).to have_content 'This is a new peep'
  end

  scenario 'user cannot post a peep if not logged in' do
    expect(page).not_to have_field 'message'
  end
end
