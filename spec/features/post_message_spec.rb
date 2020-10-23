feature "Post a message" do
  scenario "user can post a message to chitter" do
    clear_messages_table()
    visit("/")
    fill_in :content, with: "If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently."
    click_button "Post"
    expect { page }.not_to raise_error
  end
end
