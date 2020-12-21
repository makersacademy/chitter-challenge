feature "post peep" do
  scenario "signed-up user can post a peep" do
    log_in
    click_button('New Peep')
    fill_in "body", with: "I am not signed up"
    click_button('Post')
    expect(page).to have_content("@kiriarf: I am not signed up")
  end
end
