require 'tweet'

describe Tweet do
    describe '.all' do
        it 'returns all bookmarks' do
            tweet_all = Tweet.all

            expect(tweet_all).to include('tweet 1')
            expect(tweet_all).to include('tweet 2') 
            expect(tweet_all).to include('tweet 3') 

        end
    end
end