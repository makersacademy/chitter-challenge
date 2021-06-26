require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class ChitterChat < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/index' do
    Chitter.add(params[:tweet])
    erb :index
  end

  post '/new' do
    @chitter = Chitter.view_tweets
    erb :index
  end

  run! if app_file == $0
end