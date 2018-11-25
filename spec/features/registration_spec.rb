feature 'registration' do
  scenario 'a user can sign up for Chitter' do
    visit '/'
    click_button 'Sign up'
    fill_in('username', with: 'mrtest')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign up')
    expect(page).to have_content "Welcome, mrtest"
  end
end
