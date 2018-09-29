feature "testing" do
  scenario "test" do
    visit("/")
    expect(page).to have_content('hi')
  end
end
