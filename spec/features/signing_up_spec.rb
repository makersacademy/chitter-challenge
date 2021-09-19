feature 'Signing up' do
  scenario 'Signing up and posting' do
    visit '/signup'
    fill_in 'email', with: 'test@testing.com'
    fill_in 'username', with: 'FirstN LastN'
    fill_in 'password', with: 'password'
    fill_in 'name', with: 'Testaccount123'
    click_button 'Create account'
  end
end