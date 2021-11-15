require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class ChitterApp < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/post-tweet' do
    Chitter.create(params[:tweet])
    redirect '/feed'
  end

  get '/feed' do
    @chitters = Chitter.all
    erb :feed
  end

  run! if app_file == $0
end
