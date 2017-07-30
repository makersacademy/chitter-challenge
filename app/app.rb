ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    @user = User.new
    erb(:sign_up)
  end

  post '/users' do
    @user = User.create(name:  params[:name], username: params[:username],
    email: params[:email], password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      @user.save
      redirect '/users/login'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:sign_up)
    end
  end

  get '/users/login' do
    erb(:login)
  end

  post '/users/login' do
    p params
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb(:login)
    end
  end

  get '/peeps' do
    @user = current_user
    @peeps = Peep.all
    erb :peeps, layout: :layout
  end

  get '/peeps/new' do
    erb(:new_peep)
  end

  post '/peeps' do
    peep = Peep.create(name: current_user.name, username: current_user.username,
     user_id: current_user.id,
     message: params[:message])
    peep.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
