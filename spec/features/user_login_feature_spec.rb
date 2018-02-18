feature "User Login" do
  scenario "User signs up for the first time" do
    visit '/peeps'
    click_on "Sign up"
    fill_in("email", with: "freedom@freemail.com")
    fill_in("name", with: "Fred Flinstone")
    fill_in("handle", with: "freedomFighter")
    fill_in("password", with: "Bedrock")
    click_on "Sign up"
    expect(page).to have_content("Logged in as freedomFighter")
  end
end
