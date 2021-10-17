require 'rss'
require 'open-uri'

class Rss
  
  attr_reader :feed

  def initialize(feed)
    @feed = feed
  end

  def self.create
    url = 'http://feeds.bbci.co.uk/news/uk/rss.xml' 
    URI.open(url) do |rss| 
      feed = RSS::Parser.parse(rss)
      Rss.new(feed)
    end 
  end
end