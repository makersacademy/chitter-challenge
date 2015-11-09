describe Post do
  let!(:post) do
    Post.create(peep: 'This is a test message.')
  end
  describe 'Adding a peep' do
    it 'create a post with message' do
      expect(post.peep).to eq 'This is a test message.'
    end
  end
end