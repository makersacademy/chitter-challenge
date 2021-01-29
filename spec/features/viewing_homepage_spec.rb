feature "homepage" do
  scenario "user can visit the homepage of chitter" do
    visit('/')
    expect(page).to have_content("Chitter!!")
  end
end
