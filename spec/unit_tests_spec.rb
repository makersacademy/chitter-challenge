# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature "Registers the user..." do
  subject(:test_user){User.first(username: 'Mad Hare')}

  scenario "...name field is filled in" do
    sign_up_details()
    expect(test_user.name).to have_content("Nicholas Alberto Leacock")
  end

  scenario "...username field is filled in" do
    sign_up_details()
    expect(test_user.username).to have_content("Mad Hare")
  end

  scenario "...password field is filled in" do
    sign_up_details()
    expect(test_user.password_digest).not_to have_content("abc")
  end

  scenario "...e-mail field is filled in" do
    sign_up_details()
    expect(test_user.email).to have_content("nicholas@swissmail.com")
  end

  scenario "...submit button is pressed" do
    sign_up_details()
    expect(page).to have_content("Welcome Mad Hare!")
  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter
feature "Signs the user in." do
  scenario "Username field" do
    visit '/log_in'
    expect(page).to have_field("username")
  end

  scenario "Password field" do
    visit '/log_in'
    expect(page).to have_field("password")
  end

  scenario "Submit button" do
    visit '/log_in'
    expect(page).to have_button("Submit")
  end



end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
feature "Signs the user out." do
  scenario "Log out button is pressed" do
    visit '/welcome'
    click_button "Log out"
    expect(page).to have_content("Sign Up Log In")
  end
end
