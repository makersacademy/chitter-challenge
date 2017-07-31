feature 'Signing out user' do
  scenario 'User can sign out' do
    sign_in
    click_button 'Log out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome New User')
  end
end
