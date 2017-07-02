feature 'Signing out' do

  scenario 'User can logout of session' do
    sign_up
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Welcome Chris'
  end
end
