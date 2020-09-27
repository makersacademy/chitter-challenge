feature "Post a peep" do
  scenario "user can post a peep to chitter" do
    clear_database_table()
    visit("/")
    fill_in :message, with: "If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently."
    click_button "Post"
    expect { page }.not_to raise_error
  end
end
