feature 'Signing up' do
  scenario 'I can sign up' do

    visit('/')
    fill_in('name', with: 'Jo Shmo')
    fill_in('username', with: 'Shmo89')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign up')

    expect(current_path).to eq('/peeps')
    expect(page).to have_content "Welcome, test@example.com"
  end
end