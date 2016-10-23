feature "Displaying posts" do
  scenario "index page displays posts by all users" do
    user = User.new(name: "Bob", user_name: "bob1", email: "bob@bob.com")
    Post.create(message: "This is a post", user: user)
    visit "/"

    expect(page).to have_content "This is a post"
    expect(page).to have_content "Bob"
    expect(page).to have_content "bob1"
  end
end
