feature "test infrastructure working" do
  scenario "has content on the home page" do
    visit '/'
    expect(page).to have_content "Hello world"
  end
end
