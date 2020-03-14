feature "Infrastructure Test" do
  scenario "can run app and check page content" do
    visit '/'
    expect(page).to have_content "Hello world"
  end
end
