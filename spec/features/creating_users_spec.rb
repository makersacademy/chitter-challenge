# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

# - Makers sign up to chitter with their email, password, name and a username
# - The username and email are unique

feature "Adding users" do
  scenario "a user is presented form to sign-up" do
    visit "/users/new"
    expect(page).to have_selector "form"
  end

  scenario "a user sign-up to Chitter" do
    visit "/users/new"
    fill_in "name", :with => "Elizabeth Windsor"
    fill_in "email", :with => "hrh@buckpal.queen"
    fill_in "password", :with => "queenie1"
    fill_in "username", :with => "LizzieQ"
    click_button "Sign-up"
    expect(page).to have_content "LizzieQ"
  end
end