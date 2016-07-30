feature "Posting a Peep" do
  before do
    sign_up
  end

  scenario "cannot post while logged out" do
    click_button "Logout"
    expect(page).to_not have_button "Peep!"
  end

  scenario "is able to post a peep to the feed" do
    fill_in :message, with: "Here's an example message"
    click_button "Peep!"
    expect(page).to have_content "Here's an example message"
  end

  scenario "shows the author of the peep" do
    fill_in :message, with: "something"
    click_button "Peep!"
    expect(page).to have_content "by Joe Doe (@joedoe)"
  end
end
