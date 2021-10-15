feature 'Registration' do
 scenario 'a user can sign up' do
    visit '/users/sign_up'
    fill_in('username', with: 'test_user')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, test_user"
  end
end