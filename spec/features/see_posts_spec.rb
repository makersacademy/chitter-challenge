# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'see posts' do
  scenario 'See the posts that I have published' do
    Post.create(title: 'Post', post: 'This is a post')
    visit '/posts'
    expect(page).to have_content 'This is a post'
  end

end
