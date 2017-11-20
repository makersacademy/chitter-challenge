ENV["RACK_ENV"] ||= 'TEST'

require 'sinatra/base'
require_relative 'models/peeps.rb'
require_relative 'models/posts.rb'


class Chitter < Sinatra::Base

get '/home' do
  erb(:home)
end

post '/add_comment' do
  erb(:add_comment)
end



end
