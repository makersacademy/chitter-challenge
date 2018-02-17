feature "Posting a new peep" do
  scenario "User can post a peep" do
    visit("/")
    fill_in 'peep', with: "This is my first ever tweet!"
    click_button("Submit")
    expect(page).to have_content("This is my first ever tweet!")
  end
end
