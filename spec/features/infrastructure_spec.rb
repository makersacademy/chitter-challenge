feature "can see homepage" do
  scenario "homepage route works" do
    visit("/")
    expect(page).to have_content("Welcome")
  end
end