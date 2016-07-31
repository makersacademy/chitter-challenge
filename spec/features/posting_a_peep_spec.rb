feature "Posting a Peep" do
  before do
    sign_up
  end

  scenario "cannot post while logged out" do
    click_button "Logout"
    expect(page).to_not have_button "Peep!"
  end

  scenario "message is required" do
    peep(message: nil)
    expect(page).to have_content "Message must not be blank"
  end

  scenario "is able to post a peep to the feed" do
    peep
    expect(page).to have_content "Example message"
  end

  scenario "shows the author of the peep" do
    peep
    expect(page).to have_content "by Joe Doe (@joedoe)"
  end
end
