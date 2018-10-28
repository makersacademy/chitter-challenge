feature 'Logging out' do
  scenario 'by pressibg log out' do
    register_a_user
    login_user

    click_button 'Log out'

    expect(page).not_to have_content 'Logged in as Ash Ketchum (@red)'
    expect(page).to have_link 'Register'
    expect(page).to have_link 'Login'
  end
end
