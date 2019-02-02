feature 'Viewing posts' do
  scenario 'check there are posts listed' do
    Post.create(chit: "Test chit 01")
    Post.create(chit: "Test chit 02")
    Post.create(chit: "Test chit 03")
  end
end
