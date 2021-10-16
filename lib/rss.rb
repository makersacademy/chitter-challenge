require 'rss'
require 'open-uri'

class Rss

  url = 'http://feeds.bbci.co.uk/news/in_pictures/rss.xml'
  URI.open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    puts "Title: #{feed.channel.title}"
    feed.items.each do |item|
      puts "Item: #{item.title}"
      puts "Description: #{item.a}"
      puts "Link"
    end
  end

end