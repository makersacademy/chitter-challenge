feature 'Viewing Posts' do
  include Helpers
  let!(:user) do
    User.create(name: "Sophie",
      username: "sophie",
      email: 'sophie@example.com',
      password: "password",
      password_confirmation: "password")
  end
  scenario 'see a list of posts' do
    Post.create(user: user, message: "Hey, I've posted this message on Chitter!", created_at: Time.now)
    visit '/posts'
    expect(page.status_code).to eq 200
    within "div#posts" do
      expect(page).to have_content("Hey, I've posted this message on Chitter!")
    end
  end
end
