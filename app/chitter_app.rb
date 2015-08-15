require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require './data_mapper_setup'
require './app/helpers/app_helpers'

class Chitter < Sinatra::Base
  include AppHelpers
  enable :sessions
  set :session_secret, 'super secret'
  set :views, proc { File.join(root, 'views') }
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  get '/' do
    if current_user
      redirect to '/messages'
    else
      erb :index
    end
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users/new' do
    @user = User.new(email: params[:email],
                     name: params[:name],
                     password: params[:password],
                     username: params[:username],
                     password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect to('/messages')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/messages' do
    @username = session[:username]
    erb :'/messages/messages'
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/messages')
    else
      flash.now[:errors] = ['Your login information is incorrect. Please try again.']
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session.clear
    flash.now[:notice] = ['See you again soon!']
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
