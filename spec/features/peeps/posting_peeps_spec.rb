feature "post peep" do
  scenario "non signed-up user can post a peer and specify username" do
    visit('/')
    click_button('New Peep')
    fill_in "username",	with: "kiriarf"
    fill_in "body", with: "I am not signed up"
    click_button('Post')
    expect(page).to have_content("@kiriarf: I am not signed up")
  end
end