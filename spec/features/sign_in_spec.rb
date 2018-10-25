feature 'signing in' do
  scenario 'I can create an account' do
    visit '/'
    click_button 'Register'
    fill_in('Name', with: 'John')
    fill_in('Username', with: 'User101')
    fill_in('Password', with: 'password')
    fill_in('Confirm_Password', with: 'password')
    fill_in('Email', with: 'my@email.com')
    click_button 'Submit'
    expect(page).to have_content "Logged in as John"
  end
end
