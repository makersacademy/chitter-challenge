ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require './models/peep'
require './models/user'

# controller for Chitter app
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
    @user = User.first_or_create(username: params[:username],
                                 email: params[:email])
    p @user
    @user.save
    redirect '/home'
  end

  post '/loggedin' do
    @user = User.get(username: params[:username], email: params[:email])
    p @user
    redirect '/home'
  end

  get '/home' do
    erb(:homeoptions)
  end

  get '/peep' do
    erb(:peep)
  end

  post '/allpeeps' do
    peep = Peep.create(peep: params[:peep], timestamp: DateTime.now)
    peep.save
    redirect '/view'
  end

  get '/mypeeps' do
    @peeps = Peep.get(username: params[:username], email: params[:email])
    erb(:view)
  end

  get '/view' do
    @peeps = Peep.all
    erb(:view)
  end
  run! if app_file == app.rb
end
