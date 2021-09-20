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

  get '/feed/new' do
    erb :new_peep
  end  

  post '/feed' do
    ChitterFeed.add(peep: params[:peep])
    redirect '/feed'
  end

  run! if app_file == $0
end
