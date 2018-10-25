feature "shows list of peeps" do
  scenario "it shows a list of peeps" do
    visit '/'
    expect(page).to have_content "Test Peep 1"
  end
end
