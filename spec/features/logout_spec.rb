feature "Logout" do
  scenario "logs the user out" do
    signup_and_login
    click_button 'Logout'
    expect(page).not_to have_content "Hello, JDoe123"
    expect(page).to have_content "You have logged out"
    expect(page).to have_button 'Home'
  end
end