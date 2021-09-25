feature 'logout' do
  scenario 'users can log out' do
    sign_up
    click_button 'Logout'
    expect(page).not_to have_content('Welcome, CRISPR')
  end
end