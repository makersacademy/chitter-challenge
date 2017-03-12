feature "Registers the user on the app" do
  scenario "allows user to input credentials and welcomes them" do
    log_details()
    expect(page.status_code).to be(200)
    expect(page).to have_content("Welcome Mad Hare! You are now registered on Chitter.")
  end
end
