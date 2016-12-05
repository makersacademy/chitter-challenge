feature 'sign out' do
  scenario 'User needs to be able to sign out' do
    sign_up
    click_button 'Sign out'
    expect(page).to have_content('You have signed out')
  end
end
