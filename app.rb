require "sinatra/base"
require "sinatra/reloader"
require 'sinatra/flash'
require 'uri'
require_relative "./lib/peep"
require_relative "./lib/user"
require_relative "./lib/database_connection"
require "./lib/database_connection_setup"

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(content: params[:content])
    redirect '/home'
  end

  get '/users/sign_up' do
    erb :'users/sign_up'
  end

  post '/users' do
    user = User.create(username: params['username'], firstname: params['firstname'], 
lastname: params['lastname'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/home'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    user = User.authenticate(username: params['username'], password: params['password'])
    if user
      session[:user_id] = user.id
      redirect('/home')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/login')
    end
  end
end
