require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './database_connection_setup'
require 'uri'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/peep' do
    Peep.create(text: params['peep'])
    redirect '/feed'
  end

  get '/feed' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :feed
  end

  get '/sessions/new' do
    erb :"sessions"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
    else
      flash[:notice] = 'Please check your email or password'
    end
    redirect '/feed'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    flash[:notice] = "You must submit a valid email." unless User.create(email: params[:email], password: params[:password])
    session[:user.id] = user.id
    redirect '/feed'
  end


  run! if app_file == $0
end
