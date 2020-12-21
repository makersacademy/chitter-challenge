feature "Chitter Home Page" do
  scenario "has chitter as brand" do
    visit "/"
    expect(page).to have_content "Chitter"
  end
  scenario "user can publish a new post" do
    visit "/"
    fill_in("post", with: "This is a post")
    click_button("Post")
    expect(page).to have_content "This is a post"
  end
end
