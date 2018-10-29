require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './database_connection_setup'
require './lib/user'

class ChitterManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    erb :'index'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'index'
  end

  get '/new' do
    p session
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :'signed_in'
  end

  post '/new' do
    Peep.create(message: params[:message], user_name: params[:user_name], timeofpeep: Time.now)
    redirect '/new'
  end

  delete '/:id' do
    Peep.delete(id: params[:id])
    redirect '/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    session[:user_name] = user.name
    redirect '/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/new')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/peeps'
  end

  run! if app_file == $0
end
