feature 'user login' do
  scenario 'user creates an account' do
    visit('/user/signup')
    fill_in('username', with: 'chitter_tester')
    fill_in('password', with: 'chitter_test_password')
    click_button('Sign up')
    expect(page).to have_content('Welcome to Chitter, chitter_tester!')
  end

  scenario 'user logs into existing account' do
    create_test_account
    visit('/')
    click_button('Log In')
    fill_in('username', with: 'test_user')
    fill_in('password', with: 'password1234')
    click_button('Log In')
    expect(page).to have_content('Welcome to Chitter, test_user!')
  end
end
