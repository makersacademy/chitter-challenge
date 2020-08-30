feature "User can singup" do 
  scenario "User create new account" do 
    visit("/user/sign_up")
    expect(current_path).to eq "/user/sign_up"
    fill_in("name", :with => "Test")
    fill_in("email", with: "test@test.com")
    fill_in("password", with: "test123")
    click_button "Create Account"
    expect(page).to have_content "Account created"
  end
end