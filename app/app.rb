ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, "super secret"
  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'home'
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.new(name: params[:name], email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
