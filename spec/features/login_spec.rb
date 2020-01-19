feature "login" do
  scenario "it lets a previously logged in user to log in" do
    visit '/messages'
    fill_in 'username', with: "Marcellofabbri"
    click_button 'Login'
    expect(page).to have_content "User: Marcellofabbri"
  end
end