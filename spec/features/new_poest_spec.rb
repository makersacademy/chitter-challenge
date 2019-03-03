require "pg"
feature "Making a post is possible" do
  scenario "When we make a post, it will be inside the databse" do
    visit "/posts"
    click_button "New post"
    fill_in "text", with:"The first post"
    click_button "Submit"
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT * FROM Post;")
    expect(result[0]["text"]).to eq "The first post"
  end
end
