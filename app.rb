ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require './models/peep'
require './models/user'

# controller for Chitter app
class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:home)
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    @user = User.first(username: params[:username],
                     email: params[:email])

    session[:user_id] = @user.id
    redirect '/home'
  end

  get '/create' do
    erb(:create)
  end

  post '/create' do
    @user = User.first_or_create(username: params[:username],
                                 email: params[:email])
    @user.save
    session[:user_id] = @user.id
    erb(:homeoptions)
  end

  get '/home' do
    user_id = session[:user_id]
    @user = User.get(user_id)
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
    user_id = session[:user_id]
    @user = User.get(user_id)
    puts '----------------'
    puts @user
    puts '----------------'
    @peeps = @user.peeps
    erb(:view)
  end

  get '/view' do
    @peeps = Peep.all
    erb(:view)
  end
  run! if app_file == $0
end
