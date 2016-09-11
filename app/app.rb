require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

ENV["RACK_ENV"] ||= "development"

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/feed'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      session[:username] = user.username
      redirect '/feed'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  post '/sessions/end' do
    flash[:notice] = "Goodbye, #{session[:username]}"
    session.clear
    redirect('/sessions/new')
  end

  get '/feed' do
    @user_name = session[:username]
    peeps = Peep.all
    if peeps
      @peeps = peeps
    end
    erb :'/feed'
  end

  post '/feed/post' do
    erb :'/feed/post'
  end

  post '/feed' do
    user = User.first(session[:username])
    peep = Peep.create(comment: params[:textbox])
    redirect '/feed'
  end

  run! if app_file == $0
end
