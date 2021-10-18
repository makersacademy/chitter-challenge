feature 'Registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_button 'Sign Up'
    fill_in('username', with: 'test_user')
    fill_in('name', with: 'Test')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_selector(:link_or_button, 'Sign Out')
  end
end
