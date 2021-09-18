require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter_feed'

class ChitterApp < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do 
    erb(:index)
  end

  get '/feed' do 
    #p ENV

    @feed = ChitterFeed.all
    erb(:feedpage)
  end

  run! if app_file == $0

end
