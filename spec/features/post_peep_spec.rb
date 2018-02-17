feature "Posting a peep" do
  scenario "User can post a peep" do
    visit("/")
    fill_in("peep", with: "This is my first ever peep!")
    click_button("Submit")
    expect(page).to have_content("This is my first ever peep")
  end
end