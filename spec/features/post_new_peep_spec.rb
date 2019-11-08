require "./app"

feature "Post a new peep" do
  scenario "A user can post a peep to Chitter" do
    visit("/new")
    fill_in("message", with: "I can post a peep now!")
    click_button("Post!")

    expect(page).to have_content "I can post a peep now!"
  end
end
