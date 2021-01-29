feature "testing the functionality" do
  scenario "showing text" do
    visit '/test'
    expect(page).to have_content "This is the new twitter. Chitter!"
  end
end
