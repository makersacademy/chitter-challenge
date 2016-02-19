feature "Posting messages to Chitter" do
  scenario "Can't post to Chitter if not signed in" do
    visit('/')
    expect(page).not_to have_content("Post a Peep!")
  end

  scenario "Can post a message to Chitter" do
    sign_in
    fill_in "message", with: "Here's a message!"
    click_button("Post")
    expect(page).to have_content("Here's a message!")
  end
end