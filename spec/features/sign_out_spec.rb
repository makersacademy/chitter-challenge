feature 'Sign Out:' do
  scenario 'When a user is signed in, they have the option to sign out' do
    create_account('Test', 'mrtest', 'test@test.uk', 'Testing')
    expect(page).to have_content('Not mrtest? Sign out below')
    expect(page).to have_button('Sign out')
  end

  scenario 'Logs the user out of the current session' do
    create_account('Test', 'mrtest', 'test@test.uk', 'Testing')
    click_button('Sign out')
    expect(page).to have_content('Already have an account? Sign in below.')
    expect(page).to have_content("Don't have an account yet? Sign up now!")
  end
end
