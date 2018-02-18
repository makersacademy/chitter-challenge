feature 'Sign out' do
  scenario 'A user can sign out' do
    sign_up
    click_button 'Log out'
    expect(page).to have_content "Welcome to Chitter!"
  end
end
