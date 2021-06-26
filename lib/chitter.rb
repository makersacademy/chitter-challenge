require 'date'
require './lib/tweet'
require 'pg'

class Chitter
  attr_reader :tweets

  def initialize
    @tweets = []
  end

  def add(tweet)
    connect = PG.connect()
    @tweets.push(tweet)
  end

  def view_tweets
    @tweets
  end

  def how_many
    @tweets.length
  end
end

