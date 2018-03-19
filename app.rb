require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep.rb'
require './database_connection_setup'
require './lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect to('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    @user = User.find(session[:user_id])
    erb :"peeps/index"
  end

  post '/peeps' do
    Peep.add(params[:Comment_box], params[:Username_box], (Time.now).strftime('%r'))
    redirect to('/peeps')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(params[:username], params[:email], params[:password])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash[:warning] = 'Please check your email or password'
      redirect to('/sessions/new')
    end
  end

  get '/sessions/delete' do
    session[:user_id] = nil
    flash[:notice] = 'You have succesfully signed out'
    redirect to('/peeps')
  end

  run! if app_file == $0

end
