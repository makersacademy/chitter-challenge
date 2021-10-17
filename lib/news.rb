require 'rss'
require 'open-uri'

class News
  
  attr_reader :feed

  def initialize(feed)
    @feed = feed
  end

  def self.create
    url = 'http://feeds.bbci.co.uk/news/uk/rss.xml' 
    URI.open(url) do |r| 
      feed = RSS::Parser.parse(r)
      News.new(feed)
    end 
  end
end
