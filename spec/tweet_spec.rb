require 'tweet'

describe Tweet do
    describe '.all' do
        it 'returns all bookmarks' do
            tweet_all = Tweet.all

            expect(tweet_all).to include('hello I am on twitter 1')
            expect(tweet_all).to include('hello I am on twitter 2') 
            expect(tweet_all).to include('hello I am on twitter 3') 

        end
    end
end