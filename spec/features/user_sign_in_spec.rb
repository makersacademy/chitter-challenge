feature 'User signs in' do
  scenario 'User can sign in' do
    sign_up
    sign_in
    expect(page).to have_content('Welcome back, dylanrhodius.')
  end
end
