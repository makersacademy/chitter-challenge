
feature "Sign up" do

  scenario "I see a sign up form with fields" do
    visit('/sign_up')

    expect(page).to have_field("username")
    expect(page).to have_field("name")
    expect(page).to have_field("email")
    expect(page).to have_field("password")
    expect(page).to have_button("Sign Up")
  end

  scenario "I am welcomed after signing up" do
    sign_up(name: "Edyta")

    expect(page).to have_content("Hi, Edyta!")
  end

end
