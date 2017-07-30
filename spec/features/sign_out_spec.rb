feature 'sign out' do
  scenario 'able to sign out' do
    visit('/')
    sign_up('user', 'user@gmail.com', '1234', '1234')
    click_button 'Sign out'
    expect(page).not_to have_content('Welcome')
  end
end
