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
 
  get '/users/new' do
    erb :'users/new'
  end 

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username],
                    email: params[:email], password: params[:password],
                    password_confirmation: params[:password_confirmation] )
    if @user.save
      redirect '/sessions/new'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
  
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])

    if @user 
      session[:user_id] = @user.id
      redirect '/feeds/view'
    else
      erb :'sessions/new'
    end
  end

  get '/feeds/view' do
    erb :'/feeds/view'
  end

  run! if app_file == $0
end

