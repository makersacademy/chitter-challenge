require 'comment'
require 'tweets'
require 'user'

describe Comment do 
  describe '.create' do 
    it 'creates a comment' do 
      karen = Comment.create(comment: 'something annoying', tweet_id: '1', user_id: '1')

      expect(karen).to be_a Comment 
      expect(karen.comment).to eq 'something annoying'
    end

    describe '.where' do 
      User.create(name: 'David Attenborough', email: 'davidattenboroughk@gmail.com', password: 'SaveThePlanet123')
      Tweets.create(tweet: 'my first tweet', created_by: '1')
      Comment.create(comment: 'something annoying', tweet_id: '1', user_id: '1')
      Comment.create(comment: 'something annoying', tweet_id: '1', user_id: '1')

      Comment.where(tweet_id: '1')
    end
  end
end 
