feature 'registration' do
  scenario 'a user can sign up' do
    visit '/register'
    fill_in('username', with: 'username123')
    fill_in('email', with: 'test@example.com')
    fill_in('name', with: 'user321')
    fill_in('password', with: 'password123')
    click_button('Submit')
    expect(page).to have_content "Welcome, test@example.com"
  end
end