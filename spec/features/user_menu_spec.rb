feature "Youser can choose options" do 
  scenario "User click button Sign Up" do 
    visit("/")
    click_link "Sign Up"
    expect(page).to have_field("name")
    expect(page).to have_field("email")
    expect(page).to have_field("password")
  end

  scenario "User click button Sign Up" do 
    visit("/")
    click_link "Log In"
    expect(page).to have_field("email")
    expect(page).to have_field("password")
  end

  scenario "User login and out" do 
    User.create("Test", "test@test.com", "test123")
    log_in
    expect(page).to have_content "Welcome to Chitter Test"
    click_link "Log Out"
    expect(page).not_to have_content "Welcome to Chitter Test"
  end

end