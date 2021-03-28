require 'tweets'

describe Tweets do 
  let(:david) { Tweets.all }

  describe '.all' do 
    it 'should return a list of all tweets' do 
      Tweets.create(tweet: 'my first tweet')

      expect(david.first.tweet).to include 'my first tweet'
    end
  end 

  describe '.create' do 
    it 'should be able to add new tweets in the database' do 
      Tweets.create(tweet: 'my second tweet')
      expect(david.last.tweet).to include 'my second tweet'
    end
  end

  describe '.delete' do 
    it 'can delete tweets as well' do 
      Tweets.delete(1)
      expect(david).to be_empty
    end 
  end 
end 
