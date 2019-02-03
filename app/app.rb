require 'pg'
require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/user'
require 'sinatra/flash'
require_relative '../database_connection_setup'

class Chitter < Sinatra::Base
  
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    @user = User.find(id: session[:user_id])
    erb :index
  end

  post '/process-peep' do
    Peep.create(peep: params[:peep])
    redirect '/'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect ('/')
    else
      flash[:notice] = 'Incorrect email or password'
      redirect ('/sessions/new')
    end   
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect('/')
  end

  run! if app_file == $0
end
