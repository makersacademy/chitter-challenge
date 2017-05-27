feature 'Adding Comments' do
  include Helpers
  let!(:user) do
    User.create(name: "Sophie",
      username: "sophie",
      email: 'sophie@example.com',
      password: "password",
      password_confirmation: "password")
  end
  let!(:post) do
    Post.create(message: "Hey, this is a post!", user: user, created_at: Time.now)
  end
  scenario 'a user can add a comment to a post' do
    signin
    add_comment
    expect(post.comments.map(&:comment)).to include("Hey, this is a comment!")
    within "ul#comments" do
      expect(page).to have_content("Hey, this is a comment!")
    end
  end
  scenario 'a user can add multiple comments to a post' do
    signin
    add_comment
    add_comment(comment: "Another comment")
    expect(post.comments.map(&:comment)).to include("Another comment")
    within "ul#comments" do
      expect(page).to have_content("Another comment")
    end
  end
end
