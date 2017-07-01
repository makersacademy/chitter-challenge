ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'dm_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'VERY secure secret DO NOT STEAL'
  register Sinatra::Flash

  get '/' do
    'Hello world!'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    Peep.create(message: params[:message], user_id: session[:user_id])
    redirect to '/peeps'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users/new' do
    @user = User.new(username: params[:username], email: params[:email],
                    password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
