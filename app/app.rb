ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'


require_relative 'data_mapper_setup'
require_relative 'helpers'


class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  helpers Helpers

  enable :partial_underscores
  set :partial_template_engine, :erb

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(full_name: params[:full_name],
               username: params[:username],
               email: params[:email],
               password: params[:password],
               password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash[:errors] = @user.errors.full_messages
      redirect 'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['You username and password do not match']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye, see you again soon'
    redirect '/peeps'
  end

  post '/peeps' do
    message = params[:message]
    username = current_user.username
    full_name = current_user.full_name
    Peep.create(username: username,
                full_name: full_name,
                message: message,
                created_at: Time.now)
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
