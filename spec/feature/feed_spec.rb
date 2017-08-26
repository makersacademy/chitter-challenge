feature "Feed Page" do
  scenario "Page loads" do
    expect(page.status_code).to eq 200
  end

  scenario "Posts are shown on the feed page"
  Post.create(tweet: "Hello world!")
  visit "/feed"
  within "ul#feed" do
    expect(page).to have_content "Hello World"
  end
end
