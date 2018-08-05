feature 'User Login' do
  before(:each) do
    add_users_to_db
    visit('/')
  end
  scenario 'User can login' do
    fill_in('login_username', with: 'JackIsCool')
    fill_in('login_password', with: 'hello')
    click_button('Login')
    expect(page).to have_content('Welcome JackIsCool')
  end
  context 'verification tests' do
    scenario 'User cannot login with wrong password' do
      fill_in('login_username', with: 'Durain24')
      fill_in('login_password', with: 'fakepassword')
      click_button('Login')
      expect(page).to have_content('credentials invalid')
      expect(page).to_not have_content('Welcome JackIsCool')
    end
    scenario 'User cannot login with wrong username' do
      fill_in('login_username', with: 'fakeuser')
      fill_in('login_password', with: 'fakepassword')
      click_button('Login')
      expect(page).to have_content('credentials invalid')
      expect(page).to_not have_content('Welcome JackIsCool')
    end
  end
end
