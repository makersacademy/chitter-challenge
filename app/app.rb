ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'tilt/erb'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial
  set :session_secret, 'super secret'
  set :public_folder, 'public'
  set :partial_template_engine, :erb

  enable :partial_underscores

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/sessions/new')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
