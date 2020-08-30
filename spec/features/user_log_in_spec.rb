feature "User can log in to their accounts" do 
  scenario "User is loging in" do 
    User.create("Test", "test@test.com", "test123")
    visit("/user/login")
    fill_in("email", with: "test@test.com")
    fill_in("password", with: "test123")
    click_button "GO"
    expect(page).to have_content "Welcome to Chitter Test"

  end
end