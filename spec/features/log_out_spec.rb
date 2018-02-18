require_relative 'web_helpers'

feature "user logs out" do
  scenario "user logs in successfully" do
    sign_up
    click_button("Log in")
    fill_in "username", with: "Justyna"
    fill_in "password", with: "Justyna"
    click_button("Log in")
    click_button("Log out")
    expect(page).to have_content "Thank you for visiting us, see you later!"
  end

  scenario "unsuccessfull log in" do
    sign_up
    click_button("Log in")
    fill_in "username", with: "Justyna"
    fill_in "password", with: "test"
    click_button("Log in")
    expect(page).to have_content "Username and password don't match. Try again."
  end
end



"Thank you for visiting us, see you later!"
