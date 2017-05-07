feature 'Signing out' do
  scenario 'Users can sign up successfully' do
    signs_in_successfully
    click_button 'Sign out'
    expect(page).to have_content 'You logged out!'
  end

  scenario 'Users are presented with options after signing out' do
    signs_in_successfully
    click_button 'Sign out'
    expect(page).to have_button 'Sign up to Chitter!'
    expect(page).to have_button 'Log in'
  end
end
