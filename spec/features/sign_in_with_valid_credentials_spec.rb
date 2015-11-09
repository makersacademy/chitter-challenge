feature 'Signing in' do
  scenario 'with valid credentials' do
    sign_in_with_valid_credentials
    expect(page).to have_content 'Welcome, JohnDoe!'
  end
end
