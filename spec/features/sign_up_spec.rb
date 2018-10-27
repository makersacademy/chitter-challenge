feature "Sign up" do

  scenario "I see a sign up form with a username field" do
    visit('/sign_up')
    expect(page).to have_field("Username")
  end

  scenario "I see a sign up form with a name field" do
    visit('/sign_up')
    expect(page).to have_field("Name")
  end

  scenario "I see a sign up form with a email field" do
    visit('/sign_up')
    expect(page).to have_field("email")
  end

  scenario "I see a sign up form with a password field" do
    visit('/sign_up')
    expect(page).to have_field("Password")
  end

  scenario "I see a sign up button I can click on" do
    visit('/sign_up')
    expect(page).to have_button("Sign Up")
  end
end
