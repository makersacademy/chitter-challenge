feature "Post peep" do
  scenario "visiting the index page" do
    visit("/")
    expect(page).to have_content "Chitwits"
  end
end
