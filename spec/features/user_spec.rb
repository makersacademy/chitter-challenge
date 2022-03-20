# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "users" do

  scenario "users have the opportunity to sign up" do
    visit '/'
    expect(page).to have_button "Sign up"
  end

  scenario "users can fill in their details" do
    visit '/'
    click_on 'Sign up'
    expect(page).to have_content "Name:"
    expect(page).to have_content "Username:"
    expect(page).to have_content "Email:"
    expect(page).to have_content "Password:"
    expect(page).to have_field "name"
    expect(page).to have_field "username"
    expect(page).to have_field "email"
    expect(page).to have_field "password"
  end

  scenario "users can sign up successfully" do
    visit '/'
    click_on 'Sign up'
    fill_in("name", with: "Archie")
    fill_in("username", with: "archbear")
    fill_in("email", with: "iamarchie@gmai.com")
    fill_in("password", with: "hello123")
    click_on "Sign up"
    expect(page).to have_content "Welcome to the Chitter community archbear!"
  end
end