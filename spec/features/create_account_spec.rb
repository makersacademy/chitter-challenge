feature 'accounts can be created' do
  scenario 'user creates a new account' do
    visit '/create_account'
    fill_in 'name', with: "Hannah"
    fill_in 'password', with: "password123"
    fill_in 'email', with: "test@gmail.com"
    click_button 'Create Account'
    expect(page).to have_content "Thank you for creating your new account, Hannah!"
  end
  scenario 'raises issue if user is not signed in' do
    visit '/home'
    expect(page).to have_content "You must sign in first."
  end
end
