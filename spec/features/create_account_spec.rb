feature 'Create account' do
  scenario 'succesfully signs in' do
    visit '/'
    within 'table.create-account' do
      fill_in 'username', with: 'test_user'
      fill_in 'name', with: 'Test User'
      fill_in 'email', with: 'test_user@example.com'
      fill_in 'password', with: 'Password1'
      click_button 'Sign in'
    end
    expect(page).to have_content "Welcome test_user"
  end
end
