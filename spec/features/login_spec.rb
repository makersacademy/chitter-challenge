feature 'login' do
  scenario 'existing user can log in' do
    sign_up
    click_button 'Log out'
    log_in
    expect(page).to have_content 'Welcome, Alex'
  end

  scenario 'wrong details used' do
    sign_up
    click_button 'Log out'
    bad_log_in
    expect(page).to have_content 'Email or password was incorrect'
  end

  scenario 'user can log out' do
    sign_up
    click_button 'Log out'
    expect(page).to have_content 'New here? Why not sign up?'
  end
end
