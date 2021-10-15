feature 'Signing up' do
  scenario 'user signs up and receives a confirmation message' do
    visit('/')
    click_button 'Sign up'

    expect(current_path).to eq '/user/new'

    fill_in :username, with: 'Testuser123'
    fill_in :email, with: 'test@test.com'
    fill_in :name, with: 'Test User'
    fill_in :password, with: '12345'

    click_button 'Create account'

    expect(current_path).to eq '/'

    expect(page).to have_content(
      'Your account has been successfully created, welcome to Chitter Testuser123!'
    )
  end
end
