
feature "Sign up" do

  scenario "I see a sign up form with fields" do
    visit('/sign_up')
    expect(page).to have_field("Username")
    expect(page).to have_field("Name")
    expect(page).to have_field("email")
    expect(page).to have_field("Password")
    expect(page).to have_button("Sign Up")
  end

end
