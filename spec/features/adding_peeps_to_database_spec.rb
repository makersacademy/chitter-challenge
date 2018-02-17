feature "adding peeps to the database" do
  scenario "user adds peep to the database" do
    visit('/')
    fill_in "text", with: "Good day for coding"
    fill_in "author", with: "Kota"
    click_button("Add Peep")
    expect(page).to have_content "Kota wrote: Good day for coding"
  end
end
