ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './lib/models/user.rb'
require 'byebug'
require 'sinatra/flash'

class Chitter < Sinatra::Base
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
    'Hello Chitter!'
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
      flash.now[:notice] = "Password and confirmation password don't match"
      erb :signup
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
