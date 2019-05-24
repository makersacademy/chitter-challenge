feature "testing infrastructure" do
  scenario "it loads up correctly" do
    visit '/'
    expect(page).to have_content "Hello!"
  end
end
