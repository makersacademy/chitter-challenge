require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/chitter'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

 enable :sessions, :method_override

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

  delete '/chitter/:id' do
    Chitt.delete(id: params[:id])
    redirect '/chitter'
  end
  
  patch '/chitter/:id/edit' do
    @chirp = Chitt.find(id: params[:id])
    erb(:'chitter/edit')
  end

  patch '/chitter/:id' do
    Chitt.edit(id: params[:id], chirp: params[:chirp])
    redirect '/chitter'
  end

  get '/chitter' do
    @chirp = Chitt.all
    erb(:chitter)
  end
end
