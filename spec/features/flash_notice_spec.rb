feature 'Sign up user' do
  scenario 'it should login with a user name' do
    visit('/')
    click_on('Sign in')
    expect(page).to have_content('Please sign in with a username or as a guest')
  end
end
