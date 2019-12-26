feature "the user can log out of The 411" do

  before do
    test_database_setup
    sign_up_new_user
  end

  scenario "there is a link to log out" do
    expect(page).to have_button "Log Out"
  end

  scenario "they can press the link and log out" do
    click_button "Log Out"
    expect(page).to have_content "Sorry you hadda motor!"
  end
end
