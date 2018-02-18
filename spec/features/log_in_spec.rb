require_relative 'web_helpers'

feature "user logs is" do
  scenario "user logs in successfully" do
    sign_up
    click_button("Log in")
    fill_in "username", with: "Justyna"
    fill_in "password", with: "Justyna"
    click_button("Submit")
    expect(page).to have_content "Justyna, you're logged in, happy chittering!"
  end

  scenario "unsuccessfull log in" do
    sign_up
    click_button("Log in")
    fill_in "username", with: "Justyna"
    fill_in "password", with: "test"
    click_button("Submit")
    expect(page).to have_content "Username and password don't match. Try again."
  end
end
