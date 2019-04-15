feature "Add peers" do
  scenario "You can add a new peer and list it" do
    visit("/sessions/new")
    fill_in :email, with: "test@test.com"
    fill_in :password, with: "pas1234"
    click_button "Sign in"
    visit("/peers/add")
    fill_in :content, with: "Testing the add peers feature"
    # fill_in :user, with: "BBC"
    click_button "Chit"
    expect(page).to have_content "Testing the add peers feature"
  end

  scenario "You must be logged to post" do
    visit("/peers/add")
    fill_in :content, with: "Testing the add peers feature"
    # fill_in :user, with: "BBC"
    click_button "Chit"
    expect(page).to have_content "You must be logged in to post."
  end
end
