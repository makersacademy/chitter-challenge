require 'pg'

class Tweet
    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'tweet_form_test')
        else
            connection = PG.connect(dbname: 'tweet_form')
        end
        result = connection.exec('SELECT * FROM tweet_timeline')
        result.map {|tweet_timeline| tweet_timeline['tweet']}
        end      
    end
end