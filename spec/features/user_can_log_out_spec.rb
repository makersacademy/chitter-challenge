feature 'User log-out:' do
  scenario 'Once logged in, a user can log out' do
    user = build(:user)
    sign_up(user)
    log_in(user)
    click_button 'Log out'
    expect(page).to have_content('You are now logged-out. Come back soon!')
  end
end
