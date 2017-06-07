describe Comment do

  let!(:comment) do
    Comment.create(comment_text: "I'm a comment")
  end

    describe 'has attribute' do
      it "has comment body" do
        expect(comment).to have_attributes(comment_text: "I'm a comment")
      end
    end
end
