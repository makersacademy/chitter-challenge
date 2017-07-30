feature 'sign in' do
  scenario 'sign in with a valid password' do
    visit('/')
    sign_up('user', 'user@gmail.com', '1234', '1234')
      click_button 'Sign out'
    sign_in('user@gmail.com', '1234')
    expect(page).to have_content('Welcome to Peeper')
  end
end
