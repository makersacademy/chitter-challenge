feature "Posting a peep" do
  scenario "I can post a peep to the Chitter webpage" do
    sign_up
    click_button("Post a Peep")
    fill_in :message, with: "My first peep!"
    click_button("Post")
    expect(page).to have_content("My first peep!")
  end
end
