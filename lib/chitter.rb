require 'date'

class Chitter
  attr_reader :tweets

  def initialize
    @tweets = []
  end

  def self.add(tweet)
    @tweets.push(tweet)
  end

  def self.view_tweets
    @tweets.each { |tweet| puts tweet }
  end
end

