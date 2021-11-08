feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/users/new')
    fill_in('username', with: 'kim')
    fill_in('email', with: 'kim@g.com')
    fill_in('password', with: '123456789')
    click_button('Submit')
    fill_in('peep', with: 'Hi! Im using chitter')
    click_button('Submit')

    expect(page).to have_content 'Hi! Im using chitter'
  end
end