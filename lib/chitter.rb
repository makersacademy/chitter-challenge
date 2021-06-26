require 'date'
require './lib/tweet'

class Chitter
  attr_reader :tweets

  def initialize
    @tweets = []
  end

  def add(tweet)
    @tweets.push(tweet)
  end

  def view_tweets
    @tweets
  end

  def how_many
    @tweets.length
  end
end

