# frozen_string_literal: true
require 'data_mapper'
require 'pg'
require_relative 'database_connection'

class Tweets
  attr_reader :tweet, :time

  def initialize(tweet, time)
    @tweet = tweet
    @time = time
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM tweets;')
    result.map {|entry| Tweets.new(entry['tweet'], entry['time']) }
  end

  def self.create(entry)
    result = DatabaseConnection.query("INSERT INTO tweets (tweet, time) VALUES('#{entry}', '#{Time.now}')")
  end

  def self.reverse
    result = DatabaseConnection.query('SELECT * FROM tweets ORDER BY id DESC;')
    result.map { |entry| Tweets.new(entry['tweet'], entry['time']) }
  end
end
