require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  before do
    @user = session[:user_id] ? User.find(session[:user_id]) : nil 
  end

  get '/' do
    @title = "Chitter"
    @peeps = Peep.all.order(created_at: :desc)
    erb :index
  end

  get '/peeps/new' do
    @title = "Compose Peep"
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:content], user_id: session[:user_id])
    redirect '/'
  end

  get '/users/new' do
    @title = "Sign Up"
    erb :'users/new'
  end

  post '/users' do
    new_user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      user_name: params[:user_name],
      password: params[:password],
    )
    if new_user.id.nil?
      flash[:notice] = 'There is already a user with that email or username'
      redirect '/users/new'
    else
      session[:user_id] = new_user.id
      redirect '/'
    end
  end

  get '/sessions/new' do
    @title = "Log In"
    erb :'sessions/new'
  end

  post '/sessions' do
    user_id = User.authenticate(email: params[:email], password: params[:password])
    if user_id.nil?
      flash[:notice] = 'Email or password incorrect'
      redirect '/sessions/new'
    else
      session[:user_id] = user_id
      redirect '/'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have logged out'
    redirect '/'
  end
end
