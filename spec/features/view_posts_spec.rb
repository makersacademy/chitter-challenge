feature 'Posts are displayed' do
  scenario 'A user can see posts' do
    Post.create(message: "This is a test post")
    visit '/posts'
    expect(page).to have_content('This is a test post')
  end
end
