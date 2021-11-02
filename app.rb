require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep.rb'
require './database_connection_setup.rb'

class ChitterChallenge < Sinatra::Base


  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    "All chitter peeps"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
   erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params['peep']);
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(id: params[:id])
    erb :'peeps/edit'
  end
  
  patch '/peeps/:id' do
    Peep.update(id: params[:id], peep: params[:peep])
    redirect('/peeps')
  end

  run! if app_file == $0
end
