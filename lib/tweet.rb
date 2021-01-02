require_relative './user'
require 'pg'
class Tweet
  attr_reader :message, :username, :id, :time

  def initialize(id:, username:, message:, time:)
    @id = id
    @username = username
    @message = message
    @time = Time.parse(time).strftime("%Y/%m/%d %k:%M:%S")
    end

  def self.display_tweets
    results = []
    db_results = DatabaseConnection.exec_prepared('list_tweets', [])
    db_results.map do |tweet|
      results.append(Tweet.new(id: tweet['id'], username: tweet['username'], message: tweet['message'], time: tweet['time'] ))
      
    end
    return results
end

  def self.add_tweet(username:, message:)
    begin
      result = DatabaseConnection.exec_prepared('add_new_tweet', [username, message])
      return true
  rescue StandardError
    return false
    end
  end 
end 
