require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user.rb'
require_relative './lib/peep.rb'
require_relative './lib/database_connection_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  get '/users/new' do
    erb :'users/new'
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
    flash[:notice] = "You have signed out. Come back soon!"
    redirect '/'
  end

  post '/users' do
    user = User.create(
      name: params[:name],
      email: params[:email],
      username: params[:username],
      password: params[:password]
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    @user_class = User
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(
      text: params[:message],
      user_id: session[:user_id],
    )
    redirect '/peeps'
  end

  run! if app_file == $0

end
