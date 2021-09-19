require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter_feed'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/feed' do
    @feed = ChitterFeed.all
    erb :feed
  end  

  run! if app_file == $0
end
