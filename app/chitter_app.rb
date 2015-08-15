require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :views, proc { File.join(root, 'views') }
  register Sinatra::Flash
  register Sinatra::Partial

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users/new' do
    @user = User.new(email: params[:email], name: params[:name], password: params[:password], username: params[:username], password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      session[:username] = @user.username
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
    "Sign in"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
