ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


  get '/' do
    erb :'home'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/view'
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user/new' do
    @user = User.new( name:                  params[:name],
                      email:                 params[:email],
                      username:              params[:username],
                      password:              params[:password],
                      password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/session/new' do
    erb :'session/new'
  end

  post '/session/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] =  ['User email or password is incorrect']
      erb :'session/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
