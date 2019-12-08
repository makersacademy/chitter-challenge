feature "Welcome page that greets user" do
  scenario "Should show Welcome to Chitter! Click to Chatter" do
    visit '/'
    expect(page).to have_content "Welcome to Chitter! Click to Chatter"
  end
end
