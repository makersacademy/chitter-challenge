feature 'User logout' do
  scenario ' a logged in user can logout' do
    login_to_twat
    click_button('Logout')
    expect(page).to have_content('Logged out')
    expect(page).to_not have_content('Welcome JackIsCool')
  end
  scenario 'cannot log out if not logged in' do
    visit('/')
    expect(page).to_not have_content('Logout')
  end
end
