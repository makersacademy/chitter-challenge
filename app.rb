ENV["RACK_ENV"] ||= "development"

require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require './models/peep'

# Chitter.setup(:default, "postgres://localhost/chitter")

class Chitter < Sinatra::Base

  get '/' do
    erb(:home)
  end

  get '/login' do
    erb(:login)
  end

  get '/create' do
    erb(:create)
  end

  post '/created' do
    user = User.create(username: params[:username], email: params[:email])
    user.save
    redirect '/home'
  end

  post '/loggedin' do
    user = User.get()

  end

  get '/home' do
    erb(:homeoptions)
  end

  get '/peep' do
    erb(:peep)
  end

  post '/wall' do
    peep = Peep.create(peep: params[:peep], timestamp: DateTime.now)
    peep.save
    redirect '/view'
  end

  get '/view' do
    @peeps = Peep.all
    erb(:view)
  end

  run! if app_file== $0
end
