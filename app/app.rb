ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  
  enable :sessions
  set :session_secret, 'rochefort rocks'
  register Sinatra::Flash

  get '/' do
    erb :index
  end
 
  get '/users' do
    erb :users
  end 

  post '/users/new' do
    @user = User.new(name: params[:name], username: params[:username],
                    email: params[:email], password: params[:password],
                    password_confirmation: params[:password_confirmation] )
    if @user.save
      #session[:user_id] = @user.id
      redirect '/sessions/new'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :users
    end
  end

  run! if app_file == $0
end

