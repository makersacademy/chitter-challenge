feature '/new_user' do
  scenario 'create a new username' do
    visit '/chitter'
    click_button('new user')
    fill_in('username', with: 'user1')
    click_button('Submit')
    expect(page).to have_content('username: user1')
  end
  scenario 'username next to peep' do
    visit '/chitter'
    click_button('new user')
    fill_in('username', with: 'user1')
    click_button('Submit')
    visit '/chitter'
    click_button('new peep')
    fill_in('text', with: 'peep3')
    click_button('Submit')
    expect(page).to have_content('user1: peep3')
  end
end
