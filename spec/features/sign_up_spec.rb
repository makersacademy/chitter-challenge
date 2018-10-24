feature "Sign Up" do
  scenario "User can sign up with a name, username, email, password" do
    sign_up_generic_user
    expect(page).to have_content "Welcome, Firstname Lastname! Your username is username."
  end

  scenario "User 2 can sign up with a name, username, email, password" do
    sign_up_generic_user_2
    expect(page).to have_content "Welcome, Firstname2 Lastname2! Your username is username2."
  end

  scenario "User cannot sign up if username or email are already taken" do
    sign_up_generic_user
    sign_up_generic_user
    expect(page).to have_content "Sorry, both the username and email must be unique."
  end
end
