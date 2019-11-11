feature 'signing in' do
  scenario 'allows a user to sign in' do
    visit('/chitter')
    fill_in('email', with: 'test@live.com')
    fill_in('username', with: 'User123')
    fill_in('password', with: 'SecretPassword321')
    click_button 'Sign up!'
    expect(page).to have_content 'Signed in as User123'
  end
end
