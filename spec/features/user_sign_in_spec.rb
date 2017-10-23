feature 'Sign In' do
  scenario 'I can sign in as a User' do
    sign_in
    expect(page).to have_content('Hello Tom Spencer')
  end

  scenario 'I see a fail message if I sign in incorrectly' do
    sign_in_with_wrong_password
  expect(page).to have_content('Welcome back to Chitter!')
  end
end
