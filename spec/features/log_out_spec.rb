feature 'Log out button' do
  scenario 'User logs out and homepage removes user details' do
    sign_up
    log_in
    expect(page).to have_selector(:link_or_button, 'Log out')
    click_button 'Log out'
    expect(page).to_not have_selector(:link_or_button, 'Log out')
  end
end
