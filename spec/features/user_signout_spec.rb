# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
feature 'Sign out:' do
  scenario 'User can sign out of the system' do
    sign_up
    sign_in
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end
