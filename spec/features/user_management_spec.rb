feature '#User sign up' do
  scenario 'Can sign up on chitter' do
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
    expect(page).to have_content('Welcome, Test')
  end
end

feature '#User sign in' do
  scenario 'Can log in on chitter' do
    visit('/users/log_in')
    fill_in('email': user.email, password: user.pasword)
    expect(page).to have_content("Welcome, #{user.email}")
  end
end