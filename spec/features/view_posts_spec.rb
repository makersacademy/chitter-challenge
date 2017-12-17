feature 'Posts are displayed' do
  scenario 'A user can see posts' do
    register_account
    Post.create(message: "This is a test post", user_id: User.all[0].id)
    visit '/posts'
    expect(page).to have_content('This is a test post')
  end
end
