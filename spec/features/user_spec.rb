# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "users" do

  scenario "users have the opportunity to sign up" do
    visit '/'
    expect(page).to have_button "Sign Up"
  end

  scenario "users can fill in details to sign up" do
    visit '/'
    click_on 'Sign Up'
    fill_in("first_name", with: "Archie")
    fill_in("last_name", with: "Bear")
    fill_in("username", with: "archbear")
    fill_in("email", with: "iamarchie@gmai.com")
    fill_in("password", with: "hello123")
    click_on "Sign Up"
    expect(page).to have_content "Welcome to the Chitter community archbear!"
  end
end