feature 'sign up' do
  scenario 'user can sign up' do
    visit '/'
    fill_in('your_email', with: 'test@test.com')
    fill_in('your_password', with: 'password')
    click_button('Sign up')
    expect(page).to have_content "Welcome, test@test.com"
  end
end
