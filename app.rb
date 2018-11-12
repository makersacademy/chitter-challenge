require 'sinatra/base'
require './lib/peep'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params['text'])
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(params[:id])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(params[:id])
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    Peep.update(params[:id], params[:text])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    # create the user - then
    redirect '/peeps'
  end

  run! if app_file == $0
end
