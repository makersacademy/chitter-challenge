feature 'makers can log out to chitter' do
  scenario 'successful log out when logged in' do
    sign_up
    click_button 'Log out'
    expect(page).to have_content 'Not currently logged in'
  end
end
