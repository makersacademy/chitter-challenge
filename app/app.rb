ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'bcrypt'
require './app/data_mapper_setup'
require './app/models/user'
require './app/models/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :sesion_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @user = session[:username]
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  get '/sign-in' do
    erb :'sign_in'
  end

  post '/sign-up' do
    user = User.create(name: params[:name],
           username: params[:username],
           email: params[:email],
           password: params[:password],
           password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      session[:username] = user.username
      redirect '/feed'
    else
      flash.now[:notice] = "Passwords did not match"
      erb :sign_up
    end
  end

  get '/feed' do
    redirect '/sign-in' unless session[:user_id]
    @user = session[:username]
    @peeps = Peep.all
    erb :'feed/index'
  end

  post '/sign-in' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      session[:username] = user.username
      redirect '/feed'
    else
      redirect '/'
    end
  end

  post '/sign-out' do
    session[:user_id] = nil
    session[:username] = nil
    flash.next[:notice] = 'You have signed out'
    redirect '/'
  end

  get '/user/peep' do
    erb :'user/peep'
  end

  post '/user/peep' do
    Peep.create(user: session[:username], message: params[:peep])
    redirect 'feed'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
