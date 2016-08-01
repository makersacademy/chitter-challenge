feature "Signing out" do
  scenario "a user can sign out" do
    sign_up
    sign_in
    click_button 'Sign out'
    expect(page).to have_content('Cheerio!')
    expect(page).not_to have_content('Welcome to Chitter, example_username')
  end
end
