require 'comment'

describe Comment do 
  describe '.create' do 
    it 'creates a comment' do 
      karen = Comment.create(comment: 'something annoying', tweet_id: '1', user_id: '1')

      expect(karen).to be_a Comment 
      expect(karen.comment).to eq 'something annoying'

    end
  end
end 