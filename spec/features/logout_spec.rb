feature 'logging out' do
  scenario 'user signs in, then logs out' do
    visit '/login'
    fill_in(:email, with: "test@gmail.com")
    fill_in(:password, with: "password123")
    click_button("Log In")
    click_link("Log out")
    expect(page).to have_content("You have been logged out")
    expect(page).not_to have_content("Log out")
  end
end