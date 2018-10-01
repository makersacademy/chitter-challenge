require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require './data_mapper_setup'
require './lib/message'
require './lib/user'
require_relative 'helpers'

class Twittarr < Sinatra::Base
  enable :sessions
  set :session_secret, 'arrgh'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    erb :landing_page
  end
  
  get '/login' do
    erb :login
  end

  get '/signup' do
    erb :signup
  end

  post '/connect' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:username] = @user.username
      session[:user_id] = user.id
      redirect '/dashboard'
    else
      flash[:error] = 'The email or password is incorrect'
      redirect '/login'
    end
  end
  
  get '/dashboard' do
    if session[:user_id]
      @messages = Message.all(:order => [:created_at.desc])
      erb :index
    else
      flash[:error] = 'Have to be logged in to do that.'
      redirect '/login'
    end
  end

  get '/profile/:username' do
    @username = params[:username]
    erb :profile
  end

  get '/:message/reply' do
    @message = Message.get(params[:message])
    session[:message] = @message
    @replies = session[:replies]
    erb :reply
  end

  post '/:message/reply/add' do
    session[:replies] = []
    @reply = params[:reply]
    session[:replies] << @reply
    redirect '/:message/reply'
  end

  post '/new' do
    Message.create(:message => params[:tweet], :created_at => Time.now, 
      :owner => session[:username])
    redirect "/dashboard"
  end

  post '/new/user' do
    @user = User.create(:email => params[:email], :password => params[:password], 
      :username => params[:username])
    @user.save!
    session[:username] = @user.username
    session[:user_id] = @user.id
    redirect '/dashboard'
  end

  post '/logout' do
    session.clear
    flash[:notice] = 'Successfully logged out!'
    redirect '/'
  end

  helpers helpers 
  run! if app_file == $0
end
