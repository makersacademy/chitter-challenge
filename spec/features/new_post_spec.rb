feature "New Post" do
  scenario "User able to add a new post to Chitter" do
    visit("/peeps/new")

    fill_in("peep", with: "Hi Chitter!")
    click_button("Post")

    expect(page).to have_content "Hi Chitter!"
  end
end
