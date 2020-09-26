require 'pg'
require_relative 'database_connection'
require_relative 'database_connection_setup'

class Chitter
  
  attr_reader :id, :tweet, :created_at, :username

  def initialize(id:, tweet:, created_at:, username:)
    @id = id
    @tweet = tweet
    @created_at = created_at
    @username = username

    # @tweets = ['There are owls in your gravy']
  
  end

  def self.show
    result = DatabaseConnection.query("SELECT * FROM message")
    tweet_list = result.map do |tweet|
      Chitter.new(id: tweet['id'], tweet: tweet['tweet'], created_at: tweet['created_at'], username: tweet['username'])
  end
  tweet_list.reverse
  end

  def self.add(tweet:, created_at: Time.now)
    result = DatabaseConnection.query("INSERT INTO message (tweet, created_at) VALUES('#{tweet}', '#{created_at}') RETURNING id, tweet, created_at, username;")
    Chitter.new(id: result[0]['id'], tweet: result[0]['tweet'], created_at: result[0]['created_at'], username: result[0]['username'])
  end

end