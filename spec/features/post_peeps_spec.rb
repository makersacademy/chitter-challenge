feature "post a message to peep page" do
  scenario "write a message, click post button to post a message" do
    visit '/'
    fill_in("message", with:"Hello everyone!")
    click_on("Post")
    expect(page).to have_content("Hello everyone!")
  end
end