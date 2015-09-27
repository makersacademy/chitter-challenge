require 'sinatra/partial'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial

  enable :sessions

  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  get '/' do
    @peeps = Peep.all
    erb :'index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email],
                name: params[:name],
                username: params[:username],
                password: params[:passowrd],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to ('/')
    else
      flash.now[errors] = @user.errors
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash.now[:notice] = :goodbye!
    session[:user_id] = nil
    erb :'sessions/goodbye'
  end

  get '/peep/new' do
    erb :'peeps/new'
  end

run! if app_file == Chitter
end
