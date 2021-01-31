feature "adding a post" do
  scenario "checking the posted message is on the page" do
    visit("/")
    fill_in("posted_message", with: "Posting a test message. Lorem ipsum.")
    click_button("Post")
    expect(page).to have_content("Posting a test message. Lorem ipsum.")
  end
end