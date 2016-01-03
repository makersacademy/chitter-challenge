ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './lib/models/user.rb'
require 'byebug'
require 'sinatra/flash'

class Chitter < Sinatra::Base
use Rack::MethodOverride
register Sinatra::Flash
set :public_folder, File.dirname(__FILE__)

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do

  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/peeps'
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/signup' do
    @user = User.new(name: params[:name], username: params[:username],
                    email:params[:email], password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :signup
    end
  end

  get '/peeps' do
    erb :peeps
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
