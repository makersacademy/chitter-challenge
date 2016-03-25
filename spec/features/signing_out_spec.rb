feature 'Signing out' do
  scenario 'While signed in' do
    user = create(:user)
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content("Welcome, #{user.name}!")
  end
end
