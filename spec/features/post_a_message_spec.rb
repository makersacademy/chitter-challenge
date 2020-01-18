feature "post a message" do
  scenario "it lets the user post a message" do
    visit('/messages')
    fill_in 'content', with: "Cool stuff"
    click_button "Publish"

    expect(page).to have_content "Cool stuff"
  end
end