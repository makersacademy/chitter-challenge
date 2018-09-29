feature 'Allows user to sign up' do
  scenario 'User enters details to sign up' do
    visit ('/')
    fill_in 'email', with: 'test_email'
    fill_in 'password', with: 'test_password'
    fill_in 'first_name', with: 'test_first_name'
    fill_in 'last_name', with: 'test_last_name'
    fill_in 'username', with: 'test_user_name'
    click_button 'Sign Up'
    expect(page).to have_content('Hello test_first_name')
  end
end
