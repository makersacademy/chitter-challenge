
feature 'registration' do
  scenario 'a user can sign up' do
    visit '/register'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('username', with: 'kie')
    click_button('Register')
    expect(page).to have_content "kie"
  end
end
