require 'pg'
require 'sinatra'
require 'sinatra/contrib'
require_relative '../database_connection_setup.rb'
require_relative '../lib/peep.rb'
require_relative '../lib/user.rb'

class ChitterApp < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @chitters = Peep.all
    erb(:index)
  end

  post '/message/new' do
    Peep.create(params[:message])
    redirect '/'
  end

  get '/users/new' do
    erb(:"users/new")
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

end