feature "login" do
  scenario "it lets a previously logged in user to log in" do
    visit '/messages'
    fill_in 'username', with: "Marcellofabbri"
    click_button 'Login'
    expect(page).to have_content "User: Marcellofabbri"
  end

  scenario "it lets a logged in user log out" do
    visit '/messages'
    fill_in 'username', with: "Marcellofabbri"
    click_button 'Login'
    expect(page).to have_content "User: Marcellofabbri"
    click_button 'Logout'
    expect(page).not_to have_content "User: Marcellofabbri"
  end

end