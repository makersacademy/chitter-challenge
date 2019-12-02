feature "Adding a new peep" do
  scenario "A user can add a peep to Chitter" do
    visit("/")
    click_link("New peep")

    fill_in("message", with: "Hello beautiful world :o)")
    click_button("Submit")

    expect(page).to have_content "Hello beautiful world :o)"
  end
end
