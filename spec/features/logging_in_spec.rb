feature "Logging in to Chitter" do
  scenario "User signs up and sees their username in the welcome message" do
    sign_up
    expect(page).to have_content("Welcome to Chitter, Kynosaur!")
  end

  scenario "User can log in to Chitter" do
    sign_up
    click_button("Log out")
    visit("/")
    click_button("Log in")
    fill_in("username", with: "Kynosaur")
    fill_in("password", with: "amazing_password")
    click_button("Log in")
    expect(page).to have_content("Log in successful!")
  end

  scenario "User logs in and sees their username in the welcome message" do
    sign_up
    click_button("Log out")
    visit("/")
    click_button("Log in")
    fill_in("username", with: "Kynosaur")
    fill_in("password", with: "amazing_password")
    click_button("Log in")
    click_button("Get Chittering!")
    expect(page).to have_content("Welcome to Chitter, Kynosaur!")
  end
end
