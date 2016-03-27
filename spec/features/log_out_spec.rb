feature 'Log out' do
  scenario '> should return to home page with no user name' do
    sign_up_correctly
    click_button 'Log out'
    expect(page).not_to have_content('Welcome Marty')
  end
end
