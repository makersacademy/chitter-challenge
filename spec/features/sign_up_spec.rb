require 'pry'

feature "New user sign up" do

  scenario "button leads to register page" do
    visit '/'
    click_button("Sign up")
    expect(page).to have_content("Complete the following to get started on Chitter:")
  end

  scenario "increases user count by one" do
    expect{ register }.to change(User, :count).by(1)
  end

  scenario "redirects signed in user to welcome page" do
    register
    expect(page).to have_content("Hi")
  end

  scenario "with mismatching password and confirmation" do
    expect{ register(pw_confirm: "wrongpw") }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "requires valid email address" do
    expect{ register(email: nil) }.not_to change(User, :count)
    expect{ register(email: "wrong@invalid") }.not_to change(User, :count)
  end

  scenario "duplicate usernames are prevented" do
    register
    expect{ register }.not_to change(User, :count)
    expect(page).to have_content("Username is already taken")
  end

  scenario "duplicate email addresses are prevented" do
    register
    expect{ register(username: "not_roxy") }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end

end
