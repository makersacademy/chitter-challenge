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

  scenario "User try to register twice with same email" do 
    create_acc 
    create_acc 
    expect(page).to have_content "This email is already registered"
  end

end