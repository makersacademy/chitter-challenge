require 'spec_helper'

describe Tweet do

  context 'Demonstration of how datamapper works' do

    it 'should be created and then retrieved from the database' do
      expect(Tweet.count).to eq(0)
      Tweet.create(user: 'Sean', post: 'Hello world')
      expect(Tweet.count).to eq(1)
      tweet = Tweet.first
      expect(tweet.post).to eq('Hello world')
      expect(tweet.user).to eq('Sean')
      tweet.destroy
      expect(Tweet.count).to eq(0)
    end
  end
end