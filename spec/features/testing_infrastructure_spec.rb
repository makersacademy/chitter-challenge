feature "test infrastructure" do
  scenario "infra working" do
    visit ('/')
    expect(page).to have_content("Welcome to Chitter! It's a totally-not-a-twitter-rip-off platform to share random thoughts.")
  end
end
