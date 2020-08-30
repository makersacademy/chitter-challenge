feature "User can log in to their accounts" do 
  scenario "User is loging in" do 
    User.create("Test", "test@test.com", "test123")
    log_in
    expect(page).to have_content "Welcome to Chitter Test"
  end

  scenario "User try to log in with wrong email" do 
    log_in
    expect(page).to have_content "User doesn't exist"
  end

  scenario "User try to log in with wrong password" do 
    User.create("Test", "test@test.com", "test1234")
    log_in
    expect(page).to have_content "Incorrect password"
  end
end