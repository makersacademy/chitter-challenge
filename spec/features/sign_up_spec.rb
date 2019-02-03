feature 'sign up' do
  scenario 'user can sign up' do
    visit '/start'
    fill_in('your_email', with: 'test@test.com')
    fill_in('your_password', with: 'password')
    fill_in('user_name', with: 'name')
    click_button('Sign up')
    expect(page).to have_content "Welcome, test@test.com"
  end
end
