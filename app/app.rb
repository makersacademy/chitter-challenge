ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/partial'

require_relative './data_mapper_setup'


class Chitter < Sinatra::Base

  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
            email: params[:email],
            username: params[:username],
            password: params[:password],
            password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      redirect '/users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/'
    else
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/sessions/new'
  end

  get '/peeps/new' do
    if session[:user_id]
      erb :'peeps/new'
    else
      redirect '/sessions/new'
    end
  end

  post '/peeps' do
    peep = Peep.new(content: params[:peep])
    peep.user = current_user
    if peep.save
      redirect "/peeps/#{current_user.username}"
    else
      redirect "/peeps/new"
    end
  end

  get '/peeps/:username' do
    user = User.first(username: params[:username])
    if user
      @peeps = user.peeps(:order => [:created_at.desc])
      erb :'peeps/list'
    else
      erb :'users/no_user'
    end

  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
