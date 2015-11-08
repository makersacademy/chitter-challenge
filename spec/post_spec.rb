describe Post do
  let!(:post) do
    Post.create(username: 'ezzye',
                name: 'Ezzy Elliott',
                peep: 'This is a test message.',
                )
  end
  describe 'Adding a peep' do
    expect(post.peep).to eq 'This is a test message.'
  end
end