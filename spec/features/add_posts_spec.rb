feature 'Creating Posts' do
  include Helpers
  let!(:user) do
    User.create(name: "Sophie",
      username: "sophie",
      email: 'sophie@example.com',
      password: "password",
      password_confirmation: "password")
  end
  scenario 'user can write a new post' do
    signin
    add_post
    expect(current_path).to eq "/posts"
    expect(user.posts.map(&:message)).to include("Hey, I'm a new peeper!")
    within "ul#posts" do
      expect(page).to have_content("Hey, I'm a new peeper!")
    end
  end
  scenario 'user can have multiple posts' do
    signin
    add_post
    add_post(message: "Another message")
    expect(user.posts.map(&:message)).to include("Another message")
    within "ul#posts" do
      expect(page).to have_content("Another message")
    end
  end
end
