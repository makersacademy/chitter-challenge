feature 'registration' do
  scenario 'a user can sign up' do
    visit('/')
    click_button('Sign up')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    visit('/welcomenewuser')
    expect(page).to have_content 'Welcome, test@example.com'
  end
end
