require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require 'pg'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
    also_reload 'app.rb'
  end 

  get '/' do
    'Chitter'
  end

  get '/chitter' do
    @name = session[:name]
    p @peeps = Peeps.list
    erb :chitter
  end

  get '/chitter/new_peep' do
    erb :new_peep
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    session[:name] = params[:name]
    redirect '/chitter'
  end

  post '/chitter/new_peep' do
    Peeps.post(params[:message])
    redirect '/chitter'
  end

  run! if app_file == $0
end
