feature 'User Sign up' do
  scenario 'user is at sign in screen and creates an account with valid credentials' do
    visit('/sign-up')
    fill_in('email', with: 'johnsmith@example.com')
    fill_in('full_name', with: 'John Smith')
    fill_in('username', with: 'Johnny S')
    fill_in('password', with: 'password123')
    click_on('Submit')

    expect(current_path).to eq '/'
  end
end