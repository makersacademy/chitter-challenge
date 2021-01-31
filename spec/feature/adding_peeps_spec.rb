feature "when adding a peep" do
  scenario "it should appear on the page" do
    visit("/")
    fill_in("posted_peep", with: "Posting a test message. Lorem ipsum.")
    click_button("Post")
    expect(page).to have_content("Posting a test message. Lorem ipsum.")
  end
end