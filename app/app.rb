ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/users/peeps'
  end

  get '/users/peeps/new' do
    erb :'users/peeps/new'
  end

  post '/users/peeps' do
    peep = Peep.new(peep: params[:peep], time: Time.now)
    peep.save
    redirect '/'
  end

  get '/users/peeps' do
    @peeps = Peep.all
    erb :'/users/peeps'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name], handle: params[:handle], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      @errors = @user.errors
      erb :'users/new'
    end
  end

  get '/users/log-in' do
    erb :'/users/log_in'
  end

  post '/users/log-in' do
    authd_user = User.authenticate(params[:email], params[:password])
    if authd_user
      session[:user_id] = authd_user.id
      redirect '/'
    else
      flash.now[:errors] = ["Email or password not found"]
    end
  end

  get '/users/log-out' do
    session.clear
    flash.keep[:notice] = "Goodbye!"
    redirect '/'
  end


end
