
feature "peep generation" do
  scenario "user creates a peep via form" do
    visit('peep/new')
    fill_in "content", with: "this is a test peep"
    click_on("Post Peep")
    expect(page).to have_content("this is a test peep")
  end
end
