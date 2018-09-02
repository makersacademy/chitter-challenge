feature "Users have logins" do
  scenario "User can sign up for Chitter" do
    sign_up
    expect(page).to have_content "Sign up successful"
    expect(page).to have_content "Welcome to Chitter, First Last"
  end
end
