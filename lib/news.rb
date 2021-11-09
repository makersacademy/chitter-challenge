require 'rest-client'
require 'json'

class News
  
  attr_reader :feed

  def initialize(feed)
    @feed = feed
  end

  def self.create
    url = 'https://content.guardianapis.com/search?page-size=20&api-key=test&format=json&show-fields=body,headline,thumbnail'
    response = RestClient.get(url)
    results = JSON.parse(response, object_class: OpenStruct)
    data = results.response.results
    News.new(data)
  end
end
