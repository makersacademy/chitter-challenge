feature 'Shows list of posts' do
  scenario 'I can see the list of posts users submitted' do
    Post.create(firstname: 'Simon', username: 'coder', post: 'Hello, world!')
    visit '/posts'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Hello, world!')
  end
end
