describe Post do

  context 'Demonstration of how datamapper works' do

    it 'be created and then retrieved from the db' do
      expect(Post.count). to eq(0)

      Post.create(peep: 'blah blah blah', user: 'paulwallis42')

      expect(Post.count). to eq(1)

      post = Post.first

      expect(post.peep).to eq('blah blah blah')
      expect(post.user).to eq('paulwallis42')

      post.destroy

      expect(Post.count).to eq(0)
    end
  end
end
