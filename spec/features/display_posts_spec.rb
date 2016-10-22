feature "Displaying posts" do
  scenario "index page displays posts by all users" do
    Post.create(message: "This is a post")
    visit "/"

    expect(page).to have_content "This is a post"
  end
end
