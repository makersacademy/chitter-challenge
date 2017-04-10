feature 'use log out' do
  scenario 'cannot see the name' do
    sign_up
    log_in
    click_button 'Log out'
    expect(page).not_to have_css '#current_user'
  end
end
