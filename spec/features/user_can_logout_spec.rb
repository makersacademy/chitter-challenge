feature 'logout' do
  scenario 'user can logout once already logged in' do
    login
    click_button 'Log Out'
    expect(current_path).to eq '/'
    expect(page).not_to have_content 'fakeuser'
    expect(page).to have_content 'Welcome to Chitter!'
  end

  scenario 'user sees message that they have logged out' do
    login
    click_button 'Log Out'
    expect(page).to have_content 'You have signed out.'
  end

  scenario 'user can sign up for new account or log back in after logging out' do
    login
    click_button 'Log Out'
    expect(page).to have_button 'Sign Up'
    expect(page).to have_button 'Login'
  end
end
