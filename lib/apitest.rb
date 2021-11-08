# # nethttp3.rb
# require 'uri'
# require 'net/http'

# uri = URI('https://content.guardianapis.com/search?page-size=20&api-key=test&format=json&show-fields=body,headline,thumbnail')
# res = Net::HTTP.post_form(uri, 'title' => 'foo', 'body' => 'bar', 'userID' => 1)
# puts res.body  if res.is_a?(Net::HTTPSuccess)

# nethttp.rb
require 'uri'
require 'net/http'

uri = URI('https://content.guardianapis.com/search?page-size=20&api-key=test&format=json&show-fields=body,headline,thumbnail')
res = Net::HTTP.get_response(uri)
puts res.body if res.is_a?(Net::HTTPSuccess)