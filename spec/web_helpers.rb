def sign_up_as_fred
  visit '/peeps'
  click_on "Sign up"
  fill_in("email", with: "freedom@freemail.com")
  fill_in("name", with: "Fred Flinstone")
  fill_in("handle", with: "freedomFighter")
  fill_in("password", with: "Bedrock")
  click_on "Sign up"
end
