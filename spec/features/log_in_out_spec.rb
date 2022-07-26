feature "log out" do
  scenario "users should be able to log out" do
    visit_page_and_sign_up
    click_button("Log out")
    expect(page).to have_button "Log in"
    expect(page).to have_no_content "Logged in as Kim"
  end
end

feature "log in" do
  scenario "users should be able to log in" do
    visit_page_and_sign_up
    click_button("Log out")
    click_button("Log in")
    fill_in("email", with: "fake_kim_email@gmail.com")
    fill_in("password", with: "password123")
    click_button("Submit")
    expect(page).to have_content "Logged in as Kim"
  end 
end