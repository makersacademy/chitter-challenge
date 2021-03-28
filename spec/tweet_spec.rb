require 'tweets'

describe Tweets do 
  let(:david) { Tweets.all }
  let(:comment_class) { double :comment_class }

  describe '.all' do 
    it 'should return a list of all tweets' do 
      User.create(name: 'David Attenborough', email: 'davidattenboroughk@gmail.com', password: 'SaveThePlanet123')
      Tweets.create(tweet: 'my first tweet', created_by: '1')

      expect(david.first.tweet).to include 'my first tweet'
    end
  end 

  describe '.create' do 
    it 'should be able to add new tweets in the database' do 
      User.create(name: 'David Attenborough', email: 'davidattenboroughk@gmail.com', password: 'SaveThePlanet123')
      Tweets.create(tweet: 'my second tweet', created_by: '1')
      expect(david.last.tweet).to include 'my second tweet'
    end
  end

  describe '.delete' do 
    it 'can delete tweets as well' do 
      Tweets.delete(1)
      expect(david).to be_empty
    end 
  end 

  describe '#comment' do 
    it 'should allow users to comment' do 
      tweet = Tweets.create(tweet: 'my first tweet', created_by: '1')

      expect(comment_class).to receive(:where).with(tweet_id: tweet.id)
      tweet.comment(comment_class)
    end 
  end   
end 
