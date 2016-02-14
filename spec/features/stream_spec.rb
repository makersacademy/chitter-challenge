feature "Messages stream" do
  scenario "Messages stream is public and can be seen by guests" do
    sign_up
    sign_in
    fill_in :body, with: "This is a test"
    click_button "Send"
    click_button "Sign Out"
    click_link "Conversation"
    expect(page).to have_content "This is a test"
  end
end