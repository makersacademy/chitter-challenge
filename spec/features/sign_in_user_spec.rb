feature 'Signing in user' do
  scenario 'Sign in user with email and password' do
    sign_in
    expect(page).to have_content('Welcome New User')
  end
end
