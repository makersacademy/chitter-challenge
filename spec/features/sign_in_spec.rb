feature 'signing in' do
  scenario 'I can create an account' do
    visit '/'
    click_button 'Register'
    fill_in('Username', with: 'User101')
    fill_in('Password', with: 'password')
    fill_in('Confirm Password', with: 'password')
    fill_in('Email', with: 'my@email.com')
    click_button 'Submit'
    expect(page).to have content "Signed in as User101"
  end
end
