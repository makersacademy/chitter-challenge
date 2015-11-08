ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter  < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    @user = User.new
    erb :user
  end

  post '/users' do
    @user = User.new(email: params[:email],
                   password: params[:password],
                   password_confirmation: params[:password_confirmation],
                   name: params[:name],
                   user_name: params[:user_name] )
    if @user.save
        session[:user_id] = @user.id
        redirect '/messages/index'
    else
        flash.now[:notice] = "Password and confirmation password do not match"
       erb :user
    end
  end

  get '/signin/new' do
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect 'messages/index'
    else
      redirect '/'
    end
  end

  get '/messages/index'do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
