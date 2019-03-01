feature 'user login' do
  scenario 'user creates an account' do
    visit('/user/signup')
    fill_in('username', with: 'chitter_tester')
    fill_in('password', with: 'chitter_test_password')
    click_button('Sign up')
    expect(page).to have_content('Welcome to Chitter, chitter_tester!')
  end
end
