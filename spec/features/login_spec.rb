feature "logging in" do

    scenario "sign in with correct credentials" do
      sign_up
      logout
      login
      expect(page).to have_content "Hello Amy!"
    end

    scenario "sign in with incorrect password" do
      sign_up
      logout
      login(email: "amy@gmail.com", password: "wrong_password")
      expect(page).to have_content "Incorrect email and password combination"
    end

    scenario "sign in with unrecognised email address" do
      sign_up
      logout
      login(email: "unregistered@gmail.com", password: "my_password")
      expect(page).to have_content "Incorrect email and password combination"
    end
end
