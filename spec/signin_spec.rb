feature 'signing in' do
  it 'allows the user to sign in' do
  sign_up
  visit '/signin'
  fill_in :username, with: 'Reshma123'
  fill_in :password, with: 'password'
  click_button 'Sign in'
  expect(page).to have_content "Welcome to Chitter, Reshma123"
end

end
