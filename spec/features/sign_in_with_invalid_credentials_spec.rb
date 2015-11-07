feature 'Unauthorised access denied' do
  scenario 'Not a registered user' do
    sign_in_with_invalid_credentials
    expect(page).to have_content 'Invalid email or password'
  end
end
