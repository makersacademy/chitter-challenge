require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require_relative './lib/user'
require './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, "My session secret"
  register Sinatra::Flash

  get '/' do
    @user = User.find(
      id: session[:user_id]
    )
    @peeps = Peep.peeps
    erb :index
  end

  get '/peep/new' do
    erb :'/peep/new'
  end

  post '/' do
    Peep.create_peep(peep: params[:peep])
    redirect '/'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(
      email: params[:email],
      password: params[:password]
    )

    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = 'Wrong email/password'
      redirect '/sessions/new'
    end
  end

  run! if app_file == $0
end
