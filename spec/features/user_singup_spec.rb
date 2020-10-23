feature "User can singup" do 
  scenario "User create new account" do 
    create_acc 
    expect(page).to have_content "Account created"
  end

  scenario "User try to register twice with same email" do 
    User.create("Test", "test@test.com", "test123")
    create_acc 
    expect(page).to have_content "This email is already registered"
  end

end