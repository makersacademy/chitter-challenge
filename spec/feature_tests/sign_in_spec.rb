feature 'User sign in' do
  scenario 'a user can sign in with the correct credentials' do
    sign_in
    expect(page).to have_content "Welcome 1234@5678.com"
  end
end
