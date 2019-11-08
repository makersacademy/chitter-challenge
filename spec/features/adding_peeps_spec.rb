feature "adding a new peep" do
  scenario "a user can add a new peep" do
    visit("/homepage/postpeep")
    fill_in "peeptext", with: "This is a test peep"
    click_button("submitpeep")
    visit("/homepage")

    expect(page).to have_content "This is a test peep"
  end
end
