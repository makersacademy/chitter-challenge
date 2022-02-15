feature "infrastructure is working" do
  scenario "the web server is running" do
    visit '/'
    expect(page).to have_content("Infrastructure Working")
  end
end