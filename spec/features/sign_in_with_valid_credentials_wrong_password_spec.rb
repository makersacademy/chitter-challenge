
feature 'Signing in' do
  scenario 'with valid credentials' do
    sign_in_with_valid_credentials_wrong_password
    expect(page).to have_content 'Invalid email or password'
  end
end
