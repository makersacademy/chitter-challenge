feature "User log in" do
  before do
    sign_up
  end

  scenario "an existing user can log in" do
    sign_in
    expect(page).to have_content "Welcome Luke"
  end

  scenario "user cannot log in with an invalid email" do
    sign_in(email: "luke@wrongemail.com")
    expect(page).to have_content "Incorrect email or password"
  end

  scenario "user cannot log in with an invalid password" do
    sign_in(password: "wrong_pw")
    expect(page).to have_content "Incorrect email or password"
  end
end
