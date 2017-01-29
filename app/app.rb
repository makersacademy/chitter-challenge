ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride


  get '/home' do
    @cheeps_by_time = Cheep.all(:order => [:created_at.desc])
    erb :home
  end

  get '/sign_up' do
    @user = User.new
    erb :sign_up
    end

  post '/users' do
    @user = User.new(name: params[:name],
                    email: params[:email],
                    username: params[:username],
                    password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/home'
    else
      flash.now[:error] = "Signup failed: Those details have already been used"
      erb :sign_up
    end
  end

  get '/sessions/new' do
    erb :sign_in
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/home'
    else
      flash.now[:error] = "The username or password is incorrect"
      erb :sign_in
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to '/home'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/cheep/new' do
    erb :'/cheep/new'
  end

  post '/cheeps' do
    cheep = Cheep.create(content: params[:cheep], created_at: DateTime.now, user_id: session[:user_id])
    redirect '/home'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
