feature "homepage" do
  scenario "user can visit the homepage of chitter" do
    visit('/chitter')
    expect(page).to have_content("Chitter!!")
  end
end
