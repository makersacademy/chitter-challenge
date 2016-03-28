ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'pry'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/new' do
     @user = User.new
     erb :'/users/new'
  end


  post '/signup' do
    @user = User.new(name: params[:name], email: params[:email],
                    username: params[:username], password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:notice] = "Passwords do not match or email address was not valid"
      erb :'/users/new'
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new' do
   user = User.get(session[:user_id])
    user.peeps.create(message: params[:message])
    redirect '/peeps'
 end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You have successfully signed out, goodbye!'
    redirect to '/peeps'
  end

   helpers do
   def current_user
      @current_user ||= User.get(session[:user_id])
    end
   end

    run! if app_file == $0

end
