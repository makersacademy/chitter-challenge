feature "Testing saving of username" do
  scenario "User enters 'Marek'" do
    visit '/'
    fill_in "username", with: "Marek"
    click_button "Get Peepin'"
    expect(page).to have_content "Welcome to Chitter, Marek!"
  end
end
