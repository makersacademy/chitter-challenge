require 'tweets'

describe Tweets do 
  let(:david) { Tweets.all }

  describe '.all' do 
    it 'should return a list of all tweets' do 
      expect(david).to include 'my first tweet'
    end
  end 

  describe '.create' do 
    it 'should be able to add new tweets in the database' do 
      will = Tweets.create(tweet: 'my first tweet')
    end
  end
end 