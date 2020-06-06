feature '/new_user' do
  scenario 'create a new username' do
    visit '/chitter'
    click_button('new user')
    fill_in('username', with: 'user1')
    click_button('Submit')
    expect(page).to have_content('username: user1')
  end
  scenario 'username next to piep' do
    visit '/chitter'
    click_button('new user')
    fill_in('username', with: 'user1')
    click_button('Submit')
    visit '/chitter'
    click_button('new piep')
    fill_in('text', with: 'piep3')
    click_button('Submit')
    expect(page).to have_content('user1: piep3')
  end
  scenario 'user has a password' do
    visit '/chitter'
    click_button('new user')
    fill_in('username', with: 'user1')
    fill_in('password', with: 'passsword123')
    click_button('Submit')
  end
end
