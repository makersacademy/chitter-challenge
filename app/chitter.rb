require 'sinatra'
require 'sinatra/flash'

require_relative 'lib/database_connection'
require_relative 'lib/user'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  before { @user = User.find_id(session[:id]) if session[:id] }

  configure do
    register Sinatra::Flash
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email],
      username: params[:username], password: params[:password])

    session[:id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Incorrect login details, please try again.'
      redirect '/sessions/new'
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:peep], user_id: session[:id])
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end
