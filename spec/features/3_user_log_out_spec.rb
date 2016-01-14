feature 'User Log Out' do
  scenario 'can log out' do
    user_sign_up
    expect(page).to have_button('Log out')
    click_button('Log out')
    expect(page).to have_content('Thank you and goodbye!')
    expect(page).not_to have_content('Welcome Deadpool! Chit away!')
  end
end
