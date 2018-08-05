feature 'User Login' do
  scenario 'User can login' do
    add_users_to_db
    visit('/')
    fill_in('login_username', with: 'Durain24')
    fill_in('login_password', with: '1234')
    click_button('Login')
    expect(page).to have_content('Welcome Durain')
  end
end
