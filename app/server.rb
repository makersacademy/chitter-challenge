require 'sinatra/base'
require 'sinatra/partial'
require './app/models/user'
require './app/models/message'
require 'data_mapper'
require 'dm-validations'
require './app/data_mapper_setup'
require 'rack-flash'
  


  class Chitter < Sinatra::Base
    enable :sessions
    use Rack::Flash
    use Rack::MethodOverride
    register Sinatra::Partial
    set :partial_template_engine, :erb
   


  get '/' do
    @messages = Message.all
    erb :index
  end
    
  get '/users/new' do
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/users/new' do
    @user = User.new(
    :username => params[:username],
    :name => params[:name],
    :email => params[:email],
    :password => params[:password],
    :password_confirmation => params[:password_confirmation]
    )
    
    if @user.save
      flash[:notice] = "Welcome, #{@user.username}!" 
      session[:user_id] = @user.id
      redirect('/')
    else
      flash[:errors]
      erb :'/users/new'
    end
  end

 

  post '/sessions' do

    user = User.authenticate(
    :password => params[:password],
    :username => params[:auth],
    :email => params[:auth])

    if user
      session[:user_id] = user.id
      erb :index
    else
      flash[:errors] = ["ups"]
      redirect('/sessions/new')
    end
  end

  delete '/sessions' do
    session.clear
    flash[:notice] = "bis bald!"
    erb :index
  end

  get '/messages/new' do
    erb :'/messages/new'
  end

  post '/messages/new' do
    user = User.get(session[:user_id])
    message = Message.new(:user => user)
    #Maybe the key is user_id...
    message.text = params[:text]
    message.save
    erb :index
  end


  helpers do
    def current_user
      if session[:user_id]
        @current_user = User.get(session[:user_id]).username
      
      end
    end
  end




end
