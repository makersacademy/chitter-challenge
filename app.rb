require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do 
    erb :index
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps/new' do
    Peep.add(content: params[:New_peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else 
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end

  post '/users' do 
    user = User.create(email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end
end
