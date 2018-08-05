feature 'User Login' do
  scenario 'User can login' do
    add_users_to_db
    visit('/')
    fill_in('login_username', with: 'Durain24')
    fill_in('login_password', with: '1234')
    click_button('Login')
    expect(page).to have_content('Welcome Durain')
  end
  context 'verification tests' do
    scenario 'User cannot login with wrong password' do

    end
    scenario 'User cannot login with wrong username' do

    end
  end
end
