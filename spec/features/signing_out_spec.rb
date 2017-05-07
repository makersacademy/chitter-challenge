feature 'Signing out' do
  scenario 'Users can sign up successfully' do
    signs_in_successfully
    click_button 'Sign out'
    expect(page).to have_content 'You logged out!'
  end
end
