require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/chitter'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/chitter/new' do
    erb :'/chitter/new'
  end

  post '/chitter' do
    Chitt.create(chirp: params[:chirp])
    redirect '/chitter'
  end

  enable :sessions, :method_override

  delete '/chitter/:id' do
    Chitt.delete(id: params[:id])
    redirect '/chitter'
  end
  
  get '/chitter' do
    @chirp = Chitt.all
    erb(:chitter)
  end
end
