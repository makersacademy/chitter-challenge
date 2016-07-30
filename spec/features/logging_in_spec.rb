feature "Logging in" do
  before do
    User.create(username: "joedoe",
               name: "Joe Doe",
               email: "joedoe@example.com",
               password: "notjoe",
               password_confirmation: "notjoe")
  end
  scenario "able to log in" do
    sign_in
    expect(page).to have_content "Welcome, @joedoe"
  end
  scenario "username/password combination must be correct" do
    sign_in(username: "joesomethingelse")
    expect(page).to have_content "Incorrect username/password"
    sign_in(password: "wrongpassword")
    expect(page).to have_content "Incorrect username/password"
  end
end
