# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
feature 'User logs out' do
  scenario 'successfully and sees a goodbye message' do
    sign_up
    log_in
    click_button('Log out')
    expect(page).to have_content('Goodbye!')
  end
end
