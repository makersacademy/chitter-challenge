require 'web_helpers'

feature "User Login" do
  scenario "User signs up for the first time" do
    sign_up_as_Fred
    expect(page).to have_content("Logged in as freedomFighter")
  end

  scenario "User signs up with an email which is taken" do
    sign_up_as_Fred
    click_on "Sign out"
    sign_up_as_Fred
    expect(page).to have_content "There is already an account with that email address"
  end

  scenario "User signs up with a handle which is taken" do
    sign_up_as_Fred
    click_on "Sign out"
    click_on "Sign up"
    fill_in("email", with: "fandango@freemail.com")
    fill_in("name", with: "Brian the Dog")
    fill_in("handle", with: "freedomFighter")
    fill_in("password", with: "Martini")
    click_on "Sign up"
    expect(page).to have_content "That handle has been taken, please try again"
  end
end
