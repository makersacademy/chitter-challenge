require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chit'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Welcome to Chitter!"
  end

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/chits/new' do
    erb :'chits/new'
  end

  post '/chits' do
    Chit.create(text: params[:chit])
    redirect '/chits'
  end

  run! if app_file == $0
end
