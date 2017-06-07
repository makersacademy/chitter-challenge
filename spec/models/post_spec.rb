describe Post do

  let!(:post) do
    Post.create(id: 1, message: 'Test Message')
  end

  describe "Posts have" do
    it "attributes of message and id" do
      expect(post).to have_attributes(message: 'Test Message')
      expect(post).to have_attributes(id: 1)
    end
  end

end
