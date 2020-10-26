feature 'Sign Out' do
  scenario 'A logged in user can sign out' do
    sign_in
    click_button 'Log Out'

    expect(page).to_not have_css('input[name="message"]')
    expect(page).to have_css('input[name="username"]')
  end
end
