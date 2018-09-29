feature "testing" do
  scenario "test" do
    visit("/")
    expect(page).to have_content('Test 1')
  end
end
