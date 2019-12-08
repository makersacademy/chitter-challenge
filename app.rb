require 'sinatra/base'
require './lib/chitter'
require './db_connection_setup'

class ChitterManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :'chitter/index'
  end

  get '/chitter' do
    @chitter = Chitter.all
    erb :'chitter/posts'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  post '/chitter' do
    Chitter.create(message: params['message'])
    redirect '/chitter'
  end

  delete '/chitter/:id' do
    Chitter.delete(id: params[:id])
    redirect '/chitter'
  end

  get '/chitter/:id/edit' do
    @chitter = Chitter.find(id: params[:id])
    erb :'chitter/edit'
  end

  patch '/chitter/:id' do
    Chitter.edit(id: params[:id], message: params[:message])
    redirect '/chitter'
  end

  run! if app_file == $0
end
