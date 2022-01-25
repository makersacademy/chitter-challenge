require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './docs/chitter'
require './docs/user'
require './database_connection_setup'

class ChitterApp < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
    set :server, :thin
  end

  get '/' do
    @user = User.find(id: session[:user_id])
    @peep_history = Chitter.all
    erb :index
  end

  get '/users/register' do
    erb :"users/register"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/newchitter')
    else
      flash[:notice] = 'Please check your username or password.'
      redirect('/')
    end
  end

  post '/users' do
    user = User.create(
      first_name: params['first_name'], 
      surname: params['surname'], 
      email: params['email'], 
      username: params['username'],
      password: params['password'],
      profile_image_url: params['profile_image_url']
    )
    session[:user_id] = user.id
    redirect '/'
  end
      
  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  get '/newchitter' do 
    
  end

  # get '/chitter/new' do 
  #   @user = User.find(id: session[:user_id])
  #   erb :new
  # end 

  post '/chitter/message/new' do 
    @user = User.find(id: session[:user_id])
    Chitter.create(
      message: params['message'],
      time: Time.now,
      author_id: session[:user_id],
      author_first_name: @user.first_name,
      author_surname: @user.surname,
      author_email: @user.email,
      author_username: @user.username,
      author_profile_image_url: @user.author_profile_image_url
    )
    redirect '/newchitter'
  end

  # run! if app_file == $0
end
