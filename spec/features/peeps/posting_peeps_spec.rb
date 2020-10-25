feature "post peep" do
  scenario "non signed-up user can post a peer and specify username" do
    visit('/')
    click_button('Log In')
    fill_in "email",	with: "kiriarf@chitter.com"
    fill_in "password",	with: "123"
    click_button('Log In')
    click_button('New Peep')
    fill_in "username",	with: "kiriarf"
    fill_in "body", with: "I am not signed up"
    click_button('Post')
    expect(page).to have_content("@kiriarf: I am not signed up")
  end
end