feature 'User sign up' do
  scenario 'users will be able to sign up' do
    visit('/')
    click_link('Sign up')
    expect(current_path).to eq('/users/sign_up')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: '12345')
    fill_in('name', with: 'Test')
    fill_in('username', with: 'testing_123')
    click_button('Sign up')
    expect(page).to have_content('Welcome, test@test.com')
  end
end