feature 'User sign up' do
  scenario 'users will be able to sign up' do
    visit('/users/sign_up')
    expect(page).to have_content('Email')
    expect(page).to have_content('Name')
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password Confirmation')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: '12345')
    fill_in('name', with: 'Test')
    fill_in('username', with: 'testing_123')
    click_button('Register')
    expect(current_path).to eq('/')
  end
end