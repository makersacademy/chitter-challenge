require 'tweet'

describe Tweet do
    describe '.all' do
        it 'returns all bookmarks' do
            connection = PG.connect(dbname: 'tweet_form_test')

            connection.exec("INSERT INTO tweet_timeline (tweet) VALUES ('hello I am on twitter 1');")
            connection.exec("INSERT INTO tweet_timeline (tweet) VALUES ('hello I am on twitter 2');")
            connection.exec("INSERT INTO tweet_timeline (tweet) VALUES ('hello I am on twitter 3');")

            all_tweets = Tweet.all

            expect(all_tweets).to include('hello I am on twitter 1')
            expect(all_tweets).to include('hello I am on twitter 2')
            expect(all_tweets).to include('hello I am on twitter 3')


        end
    end
end