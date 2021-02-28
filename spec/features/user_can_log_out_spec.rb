feature 'logging out' do
  scenario 'User can log out from Chitter' do

    sign_in
    click_button 'Sign out'

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out'

  end
end
