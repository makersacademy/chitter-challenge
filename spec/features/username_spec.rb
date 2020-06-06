feature '/new_user' do
  scenario 'create a new username' do
    visit '/chitter'
    click_button('new user')
    fill_in('username', with: 'user1')
    click_button('Submit')
    expect(page).to have_content('username: user1')
  end
end
