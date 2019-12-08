feature "the user can log out of Chitter" do

  before do
    test_database_setup
    sign_up_new_user
  end

  scenario "there is a link to log out" do
    expect(page).to have_link("Log out", href: "/chitter/log-out")
  end

  scenario "they can press the link and log out" do
    click_link "Log out here"
    expect(page).to have_content "You are logged out!"
  end
end
