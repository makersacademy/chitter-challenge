feature 'The user can log themselves out' do
  scenario 'once they have logged in' do
    log_in_as_billy
    click_button 'Log out'
    expect(page).to have_content 'You are now logged out.'
  end
end
