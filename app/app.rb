ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/peep.rb'
require_relative 'models/user.rb'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  require_relative 'data_mapper_setup'
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all.reverse
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps/new' do
    peep = Peep.create(name: params[:name],
    message: params[:message],
    created_at: params[:created_at])
    redirect '/'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.create(name: params[:name],
    user_name: params[:user_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    session[:name] = user.name
    if user.save
    session[:user_id] = user.id
    redirect '/'
    else
    flash[:errors] = user.errors.full_messages
    redirect '/users/new'
  end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:email],
    params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:errors] = ['The email or password is incorrect']
      redirect '/sessions/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
